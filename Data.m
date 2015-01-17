//
//  Data.m
//  Enigmatic
//
//  Created by Davis on 2/16/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import "Data.h"

@implementation Data

static Data * DataCache;

@synthesize number_rotors;
@synthesize userText;
@synthesize Scramble;
@synthesize rotorConnections;
@synthesize Config;

+ (Data*)sharedManager
{
    if(!DataCache)
    {
        DataCache = [[super alloc] init];
        [DataCache initialize];
    }
    return DataCache;
}

- (void)initialize
{
    if(!DataCache)
        return;
    
    [DataCache setNumber_rotors:[[NSNumber alloc] initWithInt:3]];
    [DataCache setUserText:[[NSMutableString alloc] initWithString:@""]];
        
        Rotor * gear1 = [[Rotor alloc] initWithOffset:'A'];   //initialize default
        Rotor * gear2 = [[Rotor alloc] initWithOffset:'A'];   //rotors
        Rotor * gear3 = [[Rotor alloc] initWithOffset:'A'];
     [DataCache setConfig:[NSMutableString stringWithString:@"AAA"]];
         
        NSMutableArray * initgears = [[NSMutableArray alloc] initWithObjects:gear1, gear2, gear3, nil];
                                                                                //initialize permenant connections for rotors
        NSMutableArray * connection1 = [[NSMutableArray alloc] initWithObjects:[[Letter alloc] initWithChar:'Z'], [[Letter alloc] initWithChar:'H'],[[Letter alloc] initWithChar:'K'], [[Letter alloc] initWithChar:'G'],[[Letter alloc] initWithChar:'D'],[[Letter alloc] initWithChar:'Q'],[[Letter alloc] initWithChar:'L'],[[Letter alloc] initWithChar:'P'],[[Letter alloc] initWithChar:'U'],[[Letter alloc] initWithChar:'E'],[[Letter alloc] initWithChar:'A'],[[Letter alloc] initWithChar:'J'],[[Letter alloc] initWithChar:'T'],[[Letter alloc] initWithChar:'C'],[[Letter alloc] initWithChar:'R'],[[Letter alloc] initWithChar:'V'],[[Letter alloc] initWithChar:'W'],[[Letter alloc] initWithChar:'M'],[[Letter alloc] initWithChar:'N'],[[Letter alloc] initWithChar:'X'],[[Letter alloc] initWithChar:'F'],[[Letter alloc] initWithChar:'S'],[[Letter alloc] initWithChar:'Y'],[[Letter alloc] initWithChar:'B'],[[Letter alloc] initWithChar:'I'],[[Letter alloc] initWithChar:'O'],nil];
        Rotor * conn1 = [[Rotor alloc] initWithArray:connection1];
        NSMutableArray * connection2 = [[NSMutableArray alloc] initWithObjects: [[Letter alloc] initWithChar:'P'],[[Letter alloc] initWithChar:'K'], [[Letter alloc] initWithChar:'Q'],[[Letter alloc] initWithChar:'R'],[[Letter alloc] initWithChar:'U'],[[Letter alloc] initWithChar:'C'],[[Letter alloc] initWithChar:'B'],[[Letter alloc] initWithChar:'S'],[[Letter alloc] initWithChar:'J'],[[Letter alloc] initWithChar:'Y'],[[Letter alloc] initWithChar:'M'],[[Letter alloc] initWithChar:'I'],[[Letter alloc] initWithChar:'F'],[[Letter alloc] initWithChar:'X'],[[Letter alloc] initWithChar:'N'],[[Letter alloc] initWithChar:'G'],[[Letter alloc] initWithChar:'V'],[[Letter alloc] initWithChar:'O'],[[Letter alloc] initWithChar:'D'],[[Letter alloc] initWithChar:'Z'],[[Letter alloc] initWithChar:'W'],[[Letter alloc] initWithChar:'L'],[[Letter alloc] initWithChar:'H'],[[Letter alloc] initWithChar:'T'],[[Letter alloc] initWithChar:'E'],[[Letter alloc] initWithChar:'A'],nil];
         Rotor * conn2 = [[Rotor alloc] initWithArray:connection2];
         NSMutableArray * connection3 = [[NSMutableArray alloc] initWithObjects: [[Letter alloc] initWithChar:'H'],[[Letter alloc] initWithChar:'Q'], [[Letter alloc] initWithChar:'P'],[[Letter alloc] initWithChar:'B'],[[Letter alloc] initWithChar:'G'],[[Letter alloc] initWithChar:'R'],[[Letter alloc] initWithChar:'T'],[[Letter alloc] initWithChar:'C'],[[Letter alloc] initWithChar:'O'],[[Letter alloc] initWithChar:'U'],[[Letter alloc] initWithChar:'J'],[[Letter alloc] initWithChar:'F'],[[Letter alloc] initWithChar:'I'],[[Letter alloc] initWithChar:'D'],[[Letter alloc] initWithChar:'A'],[[Letter alloc] initWithChar:'S'],[[Letter alloc] initWithChar:'X'],[[Letter alloc] initWithChar:'Z'],[[Letter alloc] initWithChar:'Y'],[[Letter alloc] initWithChar:'M'],[[Letter alloc] initWithChar:'E'],[[Letter alloc] initWithChar:'V'],[[Letter alloc] initWithChar:'K'],[[Letter alloc] initWithChar:'N'],[[Letter alloc] initWithChar:'L'],[[Letter alloc] initWithChar:'W'],nil];
        Rotor * conn3 = [[Rotor alloc] initWithArray:connection3];
        NSMutableArray * connection4 = [[NSMutableArray alloc] initWithObjects: [[Letter alloc] initWithChar:'H'],[[Letter alloc] initWithChar:'Q'], [[Letter alloc] initWithChar:'W'],[[Letter alloc] initWithChar:'B'],[[Letter alloc] initWithChar:'T'],[[Letter alloc] initWithChar:'Z'],[[Letter alloc] initWithChar:'G'],[[Letter alloc] initWithChar:'C'],[[Letter alloc] initWithChar:'O'],[[Letter alloc] initWithChar:'U'],[[Letter alloc] initWithChar:'J'],[[Letter alloc] initWithChar:'F'],[[Letter alloc] initWithChar:'I'],[[Letter alloc] initWithChar:'D'],[[Letter alloc] initWithChar:'S'],[[Letter alloc] initWithChar:'A'],[[Letter alloc] initWithChar:'X'],[[Letter alloc] initWithChar:'R'],[[Letter alloc] initWithChar:'Y'],[[Letter alloc] initWithChar:'M'],[[Letter alloc] initWithChar:'E'],[[Letter alloc] initWithChar:'V'],[[Letter alloc] initWithChar:'K'],[[Letter alloc] initWithChar:'N'],[[Letter alloc] initWithChar:'L'],[[Letter alloc] initWithChar:'P'],nil];
        Rotor * conn4 = [[Rotor alloc] initWithArray:connection4];
        
         NSMutableArray * connection5 = [[NSMutableArray alloc] initWithObjects:[[Letter alloc] initWithChar:'L'], [[Letter alloc] initWithChar:'O'],[[Letter alloc] initWithChar:'I'], [[Letter alloc] initWithChar:'W'],[[Letter alloc] initWithChar:'D'],[[Letter alloc] initWithChar:'Q'],[[Letter alloc] initWithChar:'Z'],[[Letter alloc] initWithChar:'U'],[[Letter alloc] initWithChar:'P'],[[Letter alloc] initWithChar:'E'],[[Letter alloc] initWithChar:'A'],[[Letter alloc] initWithChar:'C'],[[Letter alloc] initWithChar:'T'],[[Letter alloc] initWithChar:'J'],[[Letter alloc] initWithChar:'V'],[[Letter alloc] initWithChar:'R'],[[Letter alloc] initWithChar:'G'],[[Letter alloc] initWithChar:'M'],[[Letter alloc] initWithChar:'N'],[[Letter alloc] initWithChar:'X'],[[Letter alloc] initWithChar:'F'],[[Letter alloc] initWithChar:'S'],[[Letter alloc] initWithChar:'Y'],[[Letter alloc] initWithChar:'B'],[[Letter alloc] initWithChar:'K'],[[Letter alloc] initWithChar:'H'],nil];
        Rotor * conn5 = [[Rotor alloc] initWithArray:connection5];
        
         NSMutableArray * connection6 = [[NSMutableArray alloc] initWithObjects:[[Letter alloc] initWithChar:'Y'], [[Letter alloc] initWithChar:'H'],[[Letter alloc] initWithChar:'G'], [[Letter alloc] initWithChar:'K'],[[Letter alloc] initWithChar:'D'],[[Letter alloc] initWithChar:'O'],[[Letter alloc] initWithChar:'T'],[[Letter alloc] initWithChar:'P'],[[Letter alloc] initWithChar:'U'],[[Letter alloc] initWithChar:'A'],[[Letter alloc] initWithChar:'E'],[[Letter alloc] initWithChar:'C'],[[Letter alloc] initWithChar:'R'],[[Letter alloc] initWithChar:'V'],[[Letter alloc] initWithChar:'L'],[[Letter alloc] initWithChar:'J'],[[Letter alloc] initWithChar:'M'],[[Letter alloc] initWithChar:'W'],[[Letter alloc] initWithChar:'N'],[[Letter alloc] initWithChar:'X'],[[Letter alloc] initWithChar:'F'],[[Letter alloc] initWithChar:'S'],[[Letter alloc] initWithChar:'Z'],[[Letter alloc] initWithChar:'B'],[[Letter alloc] initWithChar:'I'],[[Letter alloc] initWithChar:'Q'],nil];
        Rotor * conn6 = [[Rotor alloc] initWithArray:connection6];
     
     
     [DataCache setRotorConnections: [[NSMutableArray alloc] initWithObjects:conn1, conn2, conn3, conn4, conn5, conn6, nil]];
        
     Scramble = [[RotorBox alloc] initWithGearbox:initgears Connections:rotorConnections num_rotors:[[NSNumber alloc] initWithInt:3]];
}



@end
