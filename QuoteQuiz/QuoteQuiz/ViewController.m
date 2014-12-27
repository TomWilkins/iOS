//
//  ViewController.m
//  QuoteQuiz
//
//  Created by Tom Wilkins on 26/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//
// Tutorial: http://www.raywenderlich.com/31814/objectively-speaking-2-a-crash-course-in-objective-c-for-ios-6
//

#import "ViewController.h"
#import "Quiz.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // initialise question index to 999
    self.currentQuestionIndex = 999;
    
    // create quiz with the correct p list
    self.quiz = [[Quiz alloc] initWithQuiz:@"quotes"];
    
    // start the quiz
    [self nextQuizItem];
    
    // set the question background colour to match the answer labels defined in nextQuizItem
    self.questionLabel.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// shows the user their score and resets the question index
- (void) quizDone{
    
    // shows the user their final score
    if (self.quiz.correctCount) {
        self.statusLabel.text = [NSString stringWithFormat:@"Quiz Done - Score %ld%%", self.quiz.numberOfQuestions / self.quiz.correctCount];
    } else {
        self.statusLabel.text = @"Quiz Done - Score: 0%";
    }
    
    // sets the start button title to 'try again' and resets the question index
    [self.startButton setTitle:@"Try Again" forState:UIControlStateNormal];
    self.currentQuestionIndex = 999;
}

// the main quiz game logic
- (void) nextQuizItem{
    
    // sets the first question up
    if(self.currentQuestionIndex == 999){
        self.currentQuestionIndex =0;
        self.statusLabel.text = @"";
    }
    // if there are still more questions to ask, move onto the next question
    else if((self.quiz.numberOfQuestions-1) > self.currentQuestionIndex){
        
        self.currentQuestionIndex++;
        
    }
    // I dont understand why is this done again?
    else{

        self.currentQuestionIndex =0;
        self.statusLabel.text = @"";
    }
    
    // if there is another question, call the next question function and set the UI
    if(self.quiz.numberOfQuestions >= self.currentQuestionIndex + 1){
        [self.quiz nextQuestion:self.currentQuestionIndex];
        self.questionLabel.text = self.quiz.quote;
        self.answer1Label.text = self.quiz.ans1;
        self.answer2Label.text = self.quiz.ans2;
        self.answer3Label.text = self.quiz.ans3;
    }
    // else the quiz has finished
    else{
        self.currentQuestionIndex = 0;
        [self quizDone];
    }
    
    // reset fields for next question
    self.answer1Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer2Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer3Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    
    self.questionCountLabel.text = [NSString stringWithFormat:@"%ld/%ld", self.currentQuestionIndex+1, self.quiz.numberOfQuestions+1];

    self.answer1Button.hidden = NO;
    self.answer2Button.hidden = NO;
    self.answer3Button.hidden = NO;
    self.startButton.hidden = YES;
    
    // shows the info button (to show the tips) if the number of tips used is less than 3
    if(self.quiz.numberOfTipsUsed < 3){
        self.infoButton.hidden = NO;
    }else{
        self.infoButton.hidden = YES;
    }
}

- (void) checkAnswer{
    
    // uses the quiz check question method that takes the current question index and the
    // current answer index
    // will return YES if the answer is correct
    if([self.quiz checkQuestion:self.currentQuestionIndex forAnswer:_currentAnswerIndex]){
        
        // if the answer is correct, it will make the answer label green to give visual indication
        if(self.currentAnswerIndex == 1){
            self.answer1Label.backgroundColor = [UIColor greenColor];
        }else if(self.currentAnswerIndex == 2){
            self.answer2Label.backgroundColor = [UIColor greenColor];
        }else if(self.currentAnswerIndex == 3){
            self.answer3Label.backgroundColor = [UIColor greenColor];
        }
    }
    // the answer was incorrect
    else{
        if(self.currentAnswerIndex == 1){
            self.answer1Label.backgroundColor = [UIColor redColor];
        }else if(self.currentAnswerIndex == 2){
            self.answer2Label.backgroundColor = [UIColor redColor];
        }else if(self.currentAnswerIndex == 3){
            self.answer3Label.backgroundColor = [UIColor redColor];
        }
    }
    
    // show the number of correct/ incorrect
    self.statusLabel.text = [NSString stringWithFormat:@"Correct: %ld Incorrect: %ld",self.quiz.correctCount, self.quiz.incorrectCount];
    
    // hide the answer UI buttons
    self.answer1Button.hidden = YES;
    self.answer2Button.hidden = YES;
    self.answer3Button.hidden = YES;
    
    // show the next question button (same as start button)
    self.startButton.hidden = NO;
    
    // set next question buttons title
    [self.startButton setTitle:@"Next" forState:UIControlStateNormal];
}

// these are basically on click events for the answer buttons
- (IBAction)ans1Action:(id)sender{
    self.currentAnswerIndex = 1;
    [self checkAnswer];
}
- (IBAction)ans2Action:(id)sender{
    self.currentAnswerIndex = 2;
    [self checkAnswer];
}
- (IBAction)ans3Action:(id)sender{
    self.currentAnswerIndex = 3;
    [self checkAnswer];
}

// goes to the next question
- (IBAction)startAgain:(id)sender{
    [self nextQuizItem];
}

// The delegate method, dissmiss the view controller
- (void)quizTipDidFinish:(QuizTipViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

// this will run when a segue is used to change view controllers
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    // run this if its the tip modal segue
    if([segue.identifier isEqualToString:@"TipModal"]){
     
        // get the tip view controller
        QuizTipViewController *detailViewController =(QuizTipViewController *) segue.destinationViewController;
        
        // set this view controller as the delegate and set the quiz text
        detailViewController.delegate = self;
        detailViewController.tipText = self.quiz.tip;
        detailViewController.numberOfTipsUsed = self.quiz.numberOfTipsUsed;
        
        self.quiz.numberOfTipsUsed ++;
        if(self.quiz.numberOfTipsUsed >= 3){
            self.infoButton.hidden = YES;
        }
        
    }
}

@end
