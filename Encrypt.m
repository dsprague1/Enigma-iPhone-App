//
//  Encrypt.m
//  Enigmatic
//
//  Created by Davis on 2/16/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import "Encrypt.h"
#import "Data.h"

@implementation Encrypt

- (void) doEncrypt
{
    Data * sharedManager = [Data sharedManager];
    RotorBox * enigMachine = sharedManager.Scramble;
    NSMutableString * hold = sharedManager.userText;
    NSMutableArray * enigBox = [enigMachine m_gearbox];
    Rotor *  first = [enigBox objectAtIndex:0];
    int indexkeep = 0;
    int rotorturn = 0;
    [enigMachine  plugboard:hold]; //run string through plugboard
    /*for(int i = 0; i < [hold length]; i++)            There's a bug somewhere in here...I'll
    {                                                   find it eventually
        char curr = [hold characterAtIndex:i];
        for(int k = 0; k < 26; k++)
        {
            if([[[[first m_gear] objectAtIndex:k] m_c_whichone] unsignedCharValue] == curr)
            {
                indexkeep = k;
                break;
            }
        }
        Letter * nLett = [[first m_gear] objectAtIndex:indexkeep];
        for(int j = 0; j < [[enigMachine m_i_num_rotors] intValue]*2-1; j++)
        {
            curr = [[[nLett next] m_c_whichone] unsignedCharValue];
            if(j >= [[enigMachine m_i_num_rotors] intValue]-1)
                nLett = [nLett prev];
            else
                nLett = [nLett next];
        }
        NSRange loc = NSMakeRange(i,1);
        [hold replaceCharactersInRange:loc withString:[NSString stringWithFormat:@"%c", curr]];
        if(i/26 == rotorturn)
            [[enigBox objectAtIndex:0] shiftRotor];
        else if(i/25 != rotorturn)
        {
            if((i-25)/25 == rotorturn)
               [[enigBox objectAtIndex:1] shiftRotor];
            else if(i/25 != rotorturn)
            {
                if((i-25)/25 == rotorturn)
                    [[enigBox objectAtIndex:2] shiftRotor];
                else if(i/25 != rotorturn)
                    [[enigBox objectAtIndex:3] shiftRotor];
                {
                    if((i-25)/25 == rotorturn)
                        [[enigBox objectAtIndex:4] shiftRotor];
                    else if(i/25 != rotorturn)
                        [[enigBox objectAtIndex:5] shiftRotor];
                }
            }
        }
    }
    [enigMachine  plugboard:hold]; //run string through [plugboard*/
    [sharedManager setUserText:hold];
}
@end
