//
//  QuizTipViewController.m
//  QuoteQuiz
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import "QuizTipViewController.h"

@interface QuizTipViewController ()

@end

@implementation QuizTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set the tip view text
    self.tipView.text = self.tipText;
    self.tipLabel.text = [NSString stringWithFormat:@"You have %ld tip(s) remaining!", 2- self.numberOfTipsUsed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// tell the delegate that the quiz tip has finished but calling the required protocol method
- (IBAction)doneAction:(id)sender{
    [self.delegate quizTipDidFinish:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
