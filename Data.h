//
//  Data.h
//  Enigmatic
//
//  Created by Davis on 2/16/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RotorBox.h"

@interface Data : NSObject
{
    NSNumber * number_rotors;
    NSMutableString * userText;
    RotorBox * Scramble;
    NSMutableArray * rotorConnections;
    NSString * Config;
}
@property (nonatomic, retain) NSNumber * number_rotors;
@property (nonatomic) NSMutableString * userText;
@property (nonatomic, copy) RotorBox * Scramble;
@property (nonatomic, retain) NSMutableArray * rotorConnections;
@property (nonatomic, retain) NSString * Config;

+ (Data*)sharedManager;

-(void)initialize;

@end
