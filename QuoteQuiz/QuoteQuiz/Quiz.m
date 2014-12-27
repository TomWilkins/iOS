//
//  Quiz.m
//  QuoteQuiz
//
//  Created by Tom Wilkins on 26/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import "Quiz.h"

// Create a private interface here
@interface Quiz()
    @property (nonatomic, strong) NSString *quote;
    @property (nonatomic, strong) NSString *ans1;
    @property (nonatomic, strong) NSString *ans2;
    @property (nonatomic, strong) NSString *ans3;

@end

@implementation Quiz

-(id)initWithQuiz : (NSString*)plistName{
    
    // wtf is going on here?
    if((self = [super init])){
        // uses the plistName to populate a mutable array
        NSString *plistCatPath = [[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"];
        
        self.movieArray = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
        
        self.numberOfQuestions = [self.movieArray count];
    }
    return self;
}

// This method assumes the pList contains an array dictionary with a defined quote and ans1-3
- (void) nextQuestion: (NSUInteger) idx{
    
    // get the quote and answers from the p list array
    self.quote = [NSString stringWithFormat:@"'%@'", self.movieArray[idx][@"quote"]];
    self.ans1 = self.movieArray[idx][@"ans1"];
    self.ans2 = self.movieArray[idx][@"ans2"];
    self.ans3 = self.movieArray[idx][@"ans3"];
    
    // if the next question is 0, restart the quiz variables
    if(idx == 0){
        self.correctCount = 0;
        self.incorrectCount = 0;
    }
}

// Checks if the question at the passing in index answer number matches the passed in value
- (BOOL) checkQuestion:(NSUInteger)question forAnswer:(NSUInteger)answer{
    NSString *ans = self.movieArray[question][@"answer"];
    
    // check result and increment the correct value
    if([ans intValue] == answer){
        self.correctCount++;
        return YES;
    }else{
        self.incorrectCount++;
        return NO;
    }
}

@end
