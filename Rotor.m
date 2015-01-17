//
//  Rotor.m
//  Enigmatic
//
//  Created by Davis on 2/15/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import "Rotor.h"
#import "Letter.h"

@implementation Rotor
@synthesize m_gear;

- (id) initWithOffset:(char)charOffset
{
    self = [super init];
    
    if(self)
    {
        m_gear = [[NSMutableArray alloc] init];
        for(int i = 0; i < 26; i++)
        {
            Letter * nlet = [[Letter alloc] initWithChar:(charOffset+i)];
            [m_gear insertObject:nlet atIndex:i];
            if(charOffset+i >= 90)
                charOffset = 64-i;
        }
    }
    return self;
}

- (id) initWithArray:(NSMutableArray *)rotor
{
    self = [super init];
    
    if(self)
    {
        m_gear = rotor;
    }
    return self;
}

- (void) printRotor
{
    for(int i = 0; i < 26; i++)
    {
        Letter * temp = [m_gear objectAtIndex:i];
        NSNumber * toprint = [temp m_c_whichone];
        NSLog(@"%c\n", [toprint unsignedCharValue]);
        if([[m_gear objectAtIndex:i] next] != nil)
        {
            Letter * temp2 = [[m_gear objectAtIndex:i] next];
            NSNumber * toprint2 = [temp2 m_c_whichone];
            NSLog(@"   %c", [toprint2 unsignedCharValue]);
        }
    }
}

- (void) setConnections:(Rotor *) conn nRotor:(Rotor *)nR
{
    Rotor * temp = nR;
    [[nR m_gear] setArray:[conn m_gear]];
    for(int i = 0; i < 26; i++)
    {
        Letter * n = [m_gear objectAtIndex:i];
        n.next = [[conn m_gear] objectAtIndex:i];
        [[[nR m_gear] objectAtIndex:i] setPrev:[[conn m_gear] objectAtIndex:i]];
        [m_gear replaceObjectAtIndex:i withObject:n];
    }
    [[nR m_gear] setArray:[temp m_gear]];
}

- (void) shiftRotor
{
    NSMutableArray * temp = [NSMutableArray arrayWithArray:[m_gear subarrayWithRange:NSMakeRange(1, 25)]];
    [temp insertObject:[m_gear objectAtIndex:0] atIndex:25];
}

@end
