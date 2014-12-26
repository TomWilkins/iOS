//
//  ViewController.h
//  QuoteGen
//
//  Created by Tom Wilkins on 26/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

    // properties are similar to variables for the app
    // nonatomic will increase performance at the cost of thread safety
    // Strong indicates that a pointer to the variable will stay in memory as long as the object exists
    // This is a pointer to the NSArray class
    @property (nonatomic, strong) NSArray *myQuotes;

    // This is a mutable (dynamic) array that can change at run time
    @property (nonatomic, strong) NSMutableArray *movieQutoes;

    // IBOutlets defines an object that can be linked to an interface element
    @property (nonatomic, strong) IBOutlet UITextView *quoteText;

    // IBAction marks the method as one that can be used to connect to a UI action
    // e.g. onClick
    -(IBAction)quoteButtonTapped:(id)sender;

    // this is going to point to a segmented control in the UI
    @property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOptions;

@end

