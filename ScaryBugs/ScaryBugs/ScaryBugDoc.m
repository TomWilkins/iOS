//
//  ScaryBugDoc.m
//  ScaryBugs
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import "ScaryBugDoc.h"
#import "ScaryBugData.h"

@implementation ScaryBugDoc

@synthesize data = _data;
@synthesize thumbImage = _thumbImage;
@synthesize fullImage= _fullImage;

-(id) initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage{
    
    if((self = [super init])){
        self.data = [[ScaryBugData alloc] initWithTitle:title rating:rating];
        self.fullImage = fullImage;
        self.thumbImage = thumbImage;
    }
    return self;
}

@end
