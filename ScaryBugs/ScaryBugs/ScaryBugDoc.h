//
//  ScaryBugDoc.h
//  ScaryBugs
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // I had to add this

@class ScaryBugData; // we intent to interact with this class in some way

@interface ScaryBugDoc : NSObject

@property (strong) ScaryBugData *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;

- (id) initWithTitle: (NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage;


@end
