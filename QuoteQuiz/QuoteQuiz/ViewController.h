//
//  ViewController.h
//  QuoteQuiz
//
//  Created by Tom Wilkins on 26/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizTipViewController.h"

@class Quiz;

// mark this view controller as the delegate of QuizTipViewController
@interface ViewController : UIViewController <QuizTipViewControllerDelegate>

// an index to keep track of the question number
// ASSIGN: generate a setter that assigns the value directly to the instance rather than copying/ retainig it
// for objects you don't directly own
@property (nonatomic, assign) NSInteger currentQuestionIndex;

@property (nonatomic, strong) Quiz *quiz;

// the current answer index
@property (assign, nonatomic) NSInteger currentAnswerIndex;

// these variables are used to keep track of the UI elements
@property (weak, nonatomic) IBOutlet UILabel * questionLabel;
@property (weak, nonatomic) IBOutlet UILabel * answer1Label;
@property (weak, nonatomic) IBOutlet UILabel * answer2Label;
@property (weak, nonatomic) IBOutlet UILabel * answer3Label;
@property (weak, nonatomic) IBOutlet UIButton * answer1Button;
@property (weak, nonatomic) IBOutlet UIButton * answer2Button;
@property (weak, nonatomic) IBOutlet UIButton * answer3Button;
@property (weak, nonatomic) IBOutlet UIImageView * movie1;
@property (weak, nonatomic) IBOutlet UIImageView * movie2;
@property (weak, nonatomic) IBOutlet UIImageView * movie3;
@property (weak, nonatomic) IBOutlet UILabel * statusLabel;
@property (weak, nonatomic) IBOutlet UIButton * startButton;
@property (weak, nonatomic) IBOutlet UIButton * infoButton;
@property (weak, nonatomic) IBOutlet UILabel * questionCountLabel;

// add the UI actions
- (IBAction)ans1Action:(id)sender;
- (IBAction)ans2Action:(id)sender;
- (IBAction)ans3Action:(id)sender;

- (IBAction)startAgain:(id)sender;

@end

