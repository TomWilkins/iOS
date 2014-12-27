//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWTRateView.h"

@class ScaryBugDoc;

// This detail view has a lot of delegates meaning it uses a lot of their behavour
@interface DetailViewController : UIViewController <UITextFieldDelegate, RWTRateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) ScaryBugDoc *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

// can also ctrl drag from UI to assistant editor to connect + create outlets
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet RWTRateView *rateView;
@property (strong, nonatomic) UIImagePickerController *picker;

- (IBAction) addPictureTapped:(id)sender;
- (IBAction) titleFieldTextChanged:(id)sender;


@end

