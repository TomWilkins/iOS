//
//  Quiz.h
//  QuoteQuiz
//
//  Created by Tom Wilkins on 26/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

// RETAIN: required when the attribute is a pointer to an object, setter method will increase retain count of the object.
@property (nonatomic, retain) NSMutableArray *movieArray;
@property (nonatomic, assign) NSInteger correctCount;
@property (nonatomic, assign) NSInteger incorrectCount;
@property (nonatomic, assign) NSInteger numberOfQuestions;

// READONLY: the object can not be changed via a setter method
@property (nonatomic, readonly, strong) NSString *quote;
@property (nonatomic, readonly, strong) NSString *ans1;
@property (nonatomic, readonly, strong) NSString *ans2;
@property (nonatomic, readonly, strong) NSString *ans3;

- (id)initWithQuiz: (NSString*)plistName;

// NSUInteger : unsigned integer object
- (void) nextQuestion: (NSUInteger) idx;

// this declaration shows how you can ask for multiple parameters
- (BOOL) checkQuestion: (NSUInteger) question forAnswer: (NSUInteger) answer;

@end
