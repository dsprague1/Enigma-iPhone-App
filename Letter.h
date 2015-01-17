//
//  Letter.h
//  Enigmatic
//
//  Created by Davis on 2/15/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Letter : NSObject
{
    NSNumber * m_c_whichone;
    Letter * next, * prev;
}
@property (nonatomic, retain) NSNumber * m_c_whichone;
@property (nonatomic, retain) Letter * next;
@property (nonatomic, retain) Letter * prev;
- (id) initWithChar:(char)character;
@end
