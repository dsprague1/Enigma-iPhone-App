//
//  Rotor.h
//  Enigmatic
//
//  Created by Davis on 2/15/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Letter.h"

@interface Rotor : NSObject
{
    NSMutableArray * m_gear;
}
@property (nonatomic, retain) NSMutableArray * m_gear;
- (id) initWithOffset:(char)charOffset;
- (id) initWithArray:(NSMutableArray *)rotor;
- (void) printRotor;
- (void) setConnections:(Rotor *)conn nRotor:(Rotor*)nR;
- (void) shiftRotor;
@end
