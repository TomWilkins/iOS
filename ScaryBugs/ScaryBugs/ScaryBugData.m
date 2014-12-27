//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

// creates the gettings/ setters e.g. self._title
@synthesize title = _title;
@synthesize rating = _rating;

- (id) initWithTitle:(NSString *)title rating:(float)rating{
    
    if((self = [super init])){ // this is the common pattern for a class constructor
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
