//
//  ViewController.m
//  QuoteGen
//
//  Created by Tom Wilkins on 26/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//
//  Based upon this tutorial: http://www.raywenderlich.com/21320/objectively-speaking-a-crash-course-in-objective-c-ios6
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// This method is called when the screen is first created
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // @ indicates a string, so @[...] indicates a string array
    self.myQuotes = @[
                      @"Live and let live",
                      @"Don't cry over spilt milk",
                      @"Always look on the bright side of life",
                      @"Nobody's perfect",
                      @"Can't see the woods for the trees",
                      @"Better to have loved and lost then not loved at all",
                      @"The early bird catches the worm",
                      @"As slow as a wet week"
                      ];
    
    // create a string that contains the path to the p list file
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    
    // pass the contents of the file as a mutable array (this works because of the defined XML array in the file)
    // It is an array of dictionaires
    self.movieQutoes = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-  (void)quoteButtonTapped:(id)sender{
    
    // display my quotes
    if(self.quoteOptions.selectedSegmentIndex == 2){
    
        // get number of rows in the array
        int arrayLength = [self.myQuotes count];// - for defined array
        //int arrayLength = [self.movieQutoes count];
        
        // get random index
        int randomIndex = (arc4random() % arrayLength);
        
        // get the quote string for random index
        NSString *quote = self.myQuotes[randomIndex];// - for defined array
        
        // get the quote from the defined index in the array of dictionaries.
        //NSString *quote = self.movieQutoes[randomIndex][@"quote"];
        
        // display the qoute in the text area
        self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@", quote];
    }else // get movie qoutes
    {
        // determine the category
        NSString *selectedCategory = @"classic";
        if(self.quoteOptions.selectedSegmentIndex ==1){
            selectedCategory = @"modern";
        }
        
        // filter array by category using predicate (a way of filtering an array)
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQutoes filteredArrayUsingPredicate:predicate];
        
        int arrayLength = [filteredArray count];
        
        if(arrayLength > 0){
            int randomIndex = (arc4random() % arrayLength);
            
            NSString *quote = filteredArray[randomIndex][@"quote"];
            
            // check to see if the quote has a source and add it if it does
            NSString *source = [[filteredArray objectAtIndex:randomIndex] valueForKey:@"source"];
            if(![source length] ==0){
                quote = [NSString stringWithFormat:@"%@\n\n(%@)", quote, source];
            }
            
            // custom qoute message on category
            if([selectedCategory isEqualToString:@"classic"]){
                quote = [NSString stringWithFormat:@"From Classic Movie\n\n%@", quote];
            }else{
                quote = [NSString stringWithFormat:@"Movie Quote\n\n%@", quote];
            }
            
            // check for particular movie title
            if([source hasPrefix:@"Harry"]){
                quote = [NSString stringWithFormat:@"YOUUURRR A WIZARD HARRYYY!!\n\n%@", quote];
            }
            
            // display quote
            self.quoteText.text = quote;
        }else{
            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display"];
        }
    }
    
}

@end
