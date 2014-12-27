//
//  ScaryBugData.h
//  ScaryBugs
//
//  Created by Tom Wilkins on 27/12/2014.
//  Copyright (c) 2014 Tom Wilkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject

// public properties
@property (strong) NSString *title;

// assign: property is set directly with no memory management invoved, this is what you usally set for primative types
@property (assign) float rating;

// this is basically a constructor
- (id)initWithTitle: (NSString *)title rating:(float)rating;

@end
