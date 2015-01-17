//
//  RotorBox.m
//  Enigmatic
//
//  Created by Davis on 2/15/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import "RotorBox.h"
#import "Letter.h"
#import "Rotor.h"

@implementation RotorBox
@synthesize m_gearbox, m_i_num_rotors, m_rotor_connections;

-(id) initWithGearbox:(NSMutableArray*)box Connections:(NSMutableArray*)conns num_rotors:(NSNumber*)n_r
{
    m_i_num_rotors = n_r;
    m_gearbox = box;
    
    for(int i = 0; i < [m_i_num_rotors intValue]-1; i++)
    {
        [[m_gearbox objectAtIndex:i] setConnections:[conns objectAtIndex:i] nRotor: [m_gearbox objectAtIndex:i+1]];
    }
    Rotor * a = [m_gearbox objectAtIndex:0];
    NSMutableArray * b = [a m_gear];
    Letter * c = [b objectAtIndex:0];
    NSLog(@"%c", [c m_c_whichone].unsignedCharValue);
    [self reflector:[conns objectAtIndex:[m_i_num_rotors intValue]-1]];
    return self;
}

- (void) reflector:(Rotor *)reflect 
{
    int i = [m_i_num_rotors intValue];
    int j = i-1;
    Rotor * temp = [[self m_gearbox] objectAtIndex:j];
    
    for(int i = 0; i < 26; i++)
    {
        Letter * n = [[temp m_gear] objectAtIndex:i];
        n.next = [[reflect m_gear] objectAtIndex:i];
        [[temp m_gear] replaceObjectAtIndex:i withObject:n];
    }
    [[self m_gearbox] replaceObjectAtIndex:j withObject:temp];
}

- (NSMutableString *) encrypt:(NSMutableString*)input
{
    input = [self plugboard:input];
    for(int i = 0; i < input.length; i++)
    {
        for(int j = 0; j < [m_i_num_rotors intValue]*2-2; j++)
        {
            //find input on first rotor, follow links, change characters
        }
    }
    return input;
    input = [self plugboard:input];
}

- (void) newRotors:(NSMutableArray*)rBox Connections:(NSMutableArray*)conns
{
    m_gearbox = rBox;
    for(int i = 0; i < [m_i_num_rotors intValue]-1; i++)
    {
        [[m_gearbox objectAtIndex:i] setConnections:[conns objectAtIndex:i] nRotor: [m_gearbox objectAtIndex:i+1]];
    }
    [self reflector:[conns objectAtIndex:[m_i_num_rotors intValue]-1]];
}

- (NSMutableString *) plugboard:(NSMutableString *)input
{
    for(int i = 0; i < input.length; i++)
    {
        switch ([input characterAtIndex:i])
        {
            case 'A':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"B"];
                break;
            }
            case 'B':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"A"];
                break;
            }
            case 'C':
            {
               NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"J"];
                break;
            }
            case 'D':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"R"];
                break;
            }
            case 'E':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"F"];
                break;
            }
            case 'F':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"E"];
                break;
            }
            case 'G':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"M"];
                break;
            }
            case 'H':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"Y"];
                break;
            }
            case 'I':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"P"];
                break;
            }
            case 'J':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"C"];
                break;
            }
            case 'K':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"X"];
                break;
            }
            case 'L':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"N"];
                break;
            }
            case 'M':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"G"];
                break;
            }
            case 'N':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"L"];
                break;
            }
            case 'O':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"V"];
                break;
            }
            case 'P':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"I"];
                break;
            }
            case 'Q':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"W"];
                break;
            }
            case 'R':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"D"];
                break;
            }
            case 'S':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"U"];
                break;
            }
            case 'T':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"Z"];
                break;
            }
                 case 'U':
                 {
                     NSRange range = NSMakeRange(i, 1);
                     [input replaceCharactersInRange:range withString:@"S"];
                     break;
                 }
            case 'V':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"O"];
                break;
            }
            case 'W':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"Q"];
                break;
            }
            case 'X':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"K"];
                break;
            }
            case 'Y':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"H"];
                break;
            }
            case 'Z':
            {
                NSRange range = NSMakeRange(i, 1);
                [input replaceCharactersInRange:range withString:@"T"];
                break;
            }
        }
    }
    return input;
}

@end
