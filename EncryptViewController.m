//
//  EncryptViewController.m
//  Enigmatic
//
//  Created by Davis on 2/14/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import "EncryptViewController.h"
#import "Data.h"
#import "Encrypt.h"

@implementation EncryptViewController
@synthesize userInput, setPermutations, permutationNumber, EncryptSelect;

- (double) factorialWithValue:(double)val
{
    if(val == 1 || val == 0)
        return (1);
    else if(val < 0)
        return (-1);
    
    int factorial = 1;
    for(int i = val; i > 1; i--)
        factorial += i;
    
    return factorial;
}


-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:@"EncryptViewController"
                           bundle:[NSBundle mainBundle]];
    
    if(self)
    {
        UITabBarItem * tbi = [self tabBarItem];
        [tbi setTitle:@"Encryption"];
    }
    return self;
}

- (IBAction)modifySegmentControl:(id)sender
{
    if(EncryptSelect.selectedSegmentIndex == 0)
    {
        Data * sharedManager = [Data sharedManager];
        Encrypt * e = [[Encrypt alloc] init];
        [e doEncrypt];
        [userInput setText:@""];
        [userInput setText:[sharedManager userText]];
    }

    else if(EncryptSelect.selectedSegmentIndex == 1)
    {
        Data * sharedManager = [Data sharedManager];
        Encrypt * e = [[Encrypt alloc] init];
        [e doEncrypt];
        [userInput setText:@""];
        [userInput setText:[sharedManager userText]];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    Data * sharedManager = [Data sharedManager];
    NSMutableString * temp = [[NSMutableString alloc]
                              initWithString:[userInput text]];
    temp = [NSMutableString stringWithString:[temp uppercaseString]];
    [userInput setText:temp];
    [sharedManager setUserText:temp];
    [self.view endEditing:YES];
}

- (IBAction)generateKey:(id)sender
{
    Data * sharedManager = [Data sharedManager];
    NSNumber * newRotors = [[NSNumber alloc] initWithInt:3 + arc4random()%(4)];
    [sharedManager setNumber_rotors:newRotors];
    NSMutableArray * newGears = [[NSMutableArray alloc]
                                 initWithCapacity:
                                 [newRotors unsignedIntegerValue]];
    NSMutableString * tempConfig = [[NSMutableString alloc] init];
    [sharedManager setConfig:@""];
    for(int i = 0; i < [newRotors intValue]; i++)
    {
        NSNumber * offsetVal = [[NSNumber alloc]
                                initWithInt:(65 + arc4random()%(25))];
        char off = [offsetVal unsignedCharValue];
        [tempConfig appendFormat:@"%c", off];
        Rotor * n = [[Rotor alloc] initWithOffset:
                     [offsetVal unsignedCharValue]];
        [newGears insertObject:n atIndex:i];
    }
    [sharedManager setConfig:tempConfig];
    [[sharedManager Scramble] newRotors:newGears Connections:[sharedManager rotorConnections]];
    
    NSNumber * nr= sharedManager.number_rotors;
    double power = pow(26, ([nr longValue]*2)-2);
    double totalperm = power;
    NSNumber * val = [[NSNumber alloc] initWithDouble:totalperm];
    NSString * s_value = [val stringValue];
    
    [setPermutations setText: s_value];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    Data * sharedManager = [Data sharedManager];
    NSNumber * nr= sharedManager.number_rotors;
    double power = pow(26, ([nr longValue]*2)-2);
    double totalperm = power;
    NSNumber * val = [[NSNumber alloc] initWithDouble:totalperm];
    NSString * s_value = [val stringValue];
    
    [setPermutations setText: s_value];
}

@end
