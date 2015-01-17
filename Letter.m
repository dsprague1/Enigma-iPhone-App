//
//  Letter.m
//  Enigmatic
//
//  Created by Davis on 2/15/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import "Letter.h"

@implementation Letter
@synthesize m_c_whichone, next, prev;

- (id) initWithChar:(char)character
{
    self = [super init];
    
    if(self)
    {
        NSNumber * A = [[NSNumber alloc] initWithChar:character];
        m_c_whichone = A;
        next = nil;
    }
return self;
}

@end
