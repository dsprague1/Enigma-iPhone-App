//
//  MachineViewController.m
//  Enigmatic
//
//  Created by Davis on 2/14/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import "MachineViewController.h"
#import "EncryptViewController.h"
#import "Data.h"

@implementation MachineViewController
@synthesize rotorNum, sliderNum, rotorConfig;
@synthesize text;

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:@"MachineViewController"
                            bundle:[NSBundle mainBundle]];
    
    if(self)
    {
        UITabBarItem * tbi = [self tabBarItem];
        [tbi setTitle:@"Machine Settings"];
        sliderNum.tag = 0; //Set slider tag to 0
        rotorNum.tag = 1;  //Set number field tag to 1
        rotorConfig.tag = 2; //Set rotor field tag to 2
        Data * sharedManager = [Data sharedManager];
        sharedManager.number_rotors = [[NSNumber alloc] initWithInt:3];
    }
    return self;
}

-(IBAction)numRotors:(id)sender
{
    Data * sharedManager = [Data sharedManager];
    UISlider * rotorSlider = (UISlider *)sender;
    int i_value = (int)[rotorSlider value];
    NSString * s_value = [NSString stringWithFormat:@"%d", i_value];
    
    if(i_value > [[rotorConfig text]length])
    {
        for(int i = 0; i <= i_value - [[sharedManager Config]length]; i++)
            [sharedManager setConfig:[[sharedManager Config] stringByAppendingString: @"A"]];
        
        [rotorConfig setText:[sharedManager Config]];
    }
    else if(i_value < [[rotorConfig text]length])
    {
        NSRange stringrange = NSMakeRange(0, i_value);
        NSString * shortstring = [[rotorConfig text] substringWithRange:stringrange];
        [rotorConfig setText:shortstring];
        [[Data sharedManager] setConfig:shortstring];
    }
    
    [rotorNum setText:s_value];
    
    NSNumber * val =[[NSNumber alloc] initWithInt:i_value];
    sharedManager.number_rotors = val;
}

-(IBAction)textValueChanged:(id)sender
{
    Data * sharedManager = [Data sharedManager];
    NSInteger textValue = [rotorNum.text intValue];
    
    if(textValue > [sliderNum value])
    {
        for(int i = 0; i <= textValue - [[sharedManager Config]length]; i++)
            [sharedManager setConfig:[[sharedManager Config] stringByAppendingString: @"A"]];
        
        [rotorConfig setText:[sharedManager Config]];
    }
    else
    {
        NSRange stringrange = NSMakeRange(0, textValue);
        NSString * shortstring = [[rotorConfig text] substringWithRange:stringrange];
        [rotorConfig setText:shortstring];
        [[Data sharedManager] setConfig:shortstring];
    }
    sliderNum.value = textValue;
}

-(IBAction)UpperCase:(id)sender
{
    NSString * uppercaseString = [[rotorConfig text] uppercaseString];
    [rotorConfig setText:uppercaseString];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    Data * sharedManager = [Data sharedManager];
    NSCharacterSet * notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];

    if([string rangeOfCharacterFromSet:notDigits].location == 0)
    {
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        int length = [currentString length];
        if (length > [sharedManager.number_rotors intValue])
            return NO;
    }
    else
    {
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        int length = [currentString length];
        if (length > 1) {
            return NO;
        }
        int a = [string intValue];
        if(a > 6)
            return NO;
        if(a < 2)
            return NO;
        return YES;
    }
return YES;
}

-(IBAction)RotorConfigChanged:(id)sender
{
    UITextField * rotorNumber = (UITextField *)sender;
    NSString * i_value = [rotorNumber text];
    NSNumber * val = [[NSNumber alloc] initWithInt:[i_value intValue]];
    
    Data * sharedManager = [Data sharedManager];
    sharedManager.number_rotors = val;
    [[sharedManager Config] stringByAppendingFormat:@"A"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    Data * datacache = [Data sharedManager];
    NSString * temp = [NSString stringWithString:[datacache Config]];
    [rotorConfig setText:[datacache Config]];
    
    sliderNum.value = [[[Data sharedManager] number_rotors] floatValue];
    
    NSString * s_value = [NSString stringWithFormat:@"%d", [[datacache number_rotors] intValue]];
    [rotorNum setText:s_value];

    //NSLog([rotorConfig text]);
    //[rotorConfig setText:[sharedManager Config]];
    //NSRange r = NSMakeRange(0, [[sharedManager number_rotors] intValue]);
}

- (void)viewDidLoad
{
    UIImage * encryptImage = [UIImage imageNamed:@"104-index-cards.png"];
    UIImage * machineImage = [UIImage imageNamed:@"20-gear2.png"];
    UITabBar * tabBar = self.tabBarController.tabBar;
    UITabBarItem * item0  = [tabBar.items objectAtIndex:0];
    UITabBarItem * item1  = [tabBar.items objectAtIndex:1];
    [item0 setFinishedSelectedImage:machineImage withFinishedUnselectedImage:machineImage];
    [item1 setFinishedSelectedImage:encryptImage withFinishedUnselectedImage:encryptImage];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";
}

@end
