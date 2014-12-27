//
//  DetailViewController.m
//  ScaryBugs
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import "DetailViewController.h"
#import "ScaryBugData.h"
#import "ScaryBugDoc.h"
#import "RWTUIImageExtras.h"
#import <UIKit/UIKit.h>

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize picker = _picker;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // this mehtod is called in viewDidLoad
    
    // set the RWTRateView properties
    self.rateView.notSelectedImage = [UIImage imageNamed:@"shockedface2_empty.png"];
    
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"shockedface2_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"shockedface2_full.png"];
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    
    // sets initial UI state
    if(self.detailItem){
        self.titleField.text = self.detailItem.data.title;
        self.rateView.rating = self.detailItem.data.rating;
        self.imageView.image = self.detailItem.fullImage;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)titleFieldTextChanged:(id)sender {
    // updates the model when the user changes the value of the text field
    self.detailItem.data.title = self.titleField.text;
    
}

// paragma marks are used to tell people that a method is for a particular delegate
#pragma mark UITextFieldDelegate

// called when the user hits the return key on the keyboard, call resign first responder to get the keyboard to disppear
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark RWTRateViewDelegate

// called when the user changes the rating, updates the model
- (void) rateView:(RWTRateView *)rateView ratingDidChange:(float)rating{
    self.detailItem.data.rating = rating;
}

-(IBAction)addPictureTapped:(id)sender{
    
    // create the UIImage picker if it doesnt exist already
    if(self.picker == nil){
        self.picker = [[UIImagePickerController alloc] init];
        self.picker.delegate = self;
        
        // this source opens the users photo library, can use other sources as well
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.picker.allowsEditing = NO;
    }
    
    // animates the picker
    [self presentViewController:_picker animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate

// user dismisses the picker without selecting an image
- (void)imagePickerController:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // gets the image from the picker, then creates a thumb image using the Helper RWTUIImageExtras
    UIImage *fullImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *thumbImage = [fullImage imageByScalingAndCroppingForSize:CGSizeMake(44, 44)];
    
    // set the bug images
    self.detailItem.fullImage = fullImage;
    self.detailItem.thumbImage = thumbImage;
    
}


@end
