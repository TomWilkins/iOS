//
//  QuizTipViewController.h
//  QuoteQuiz
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QuizTipViewControllerDelegate;
// protocol allows classes to share similarly defined behavour
// helpful when classes are not related to each other but still behave in similar ways

// delegates are objects that perform work on behalf of another object.
// in this case, the class will notify another object that an event has occurred

// by using delegates with protocols the delegator need not be concerned with the actual objects that are doing the work

@interface QuizTipViewController : UIViewController

@property (nonatomic, assign) id <QuizTipViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextView *tipView;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (nonatomic, copy) NSString *tipText;
@property (nonatomic, assign) NSInteger numberOfTipsUsed;


// This UI action method will notify the delegate that this view should be dismissed
// Similar to Androids activity finished() where an intent is sent
- (IBAction)doneAction:(id)sender;

@end

// protocols can be declared in their own fie, but its common to do it in the header file
// any class that implements this protocol must define the methods
@protocol QuizTipViewControllerDelegate

- (void) quizTipDidFinish:(QuizTipViewController *)controller;

@end
