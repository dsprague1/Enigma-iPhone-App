//
//  MachineViewController.h
//  Enigmatic
//
//  Created by Davis on 2/14/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EncryptViewController.h"

@interface MachineViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField * rotorNum;
    IBOutlet UISlider * sliderNum;
    IBOutlet UITextField * rotorConfig;
    NSString * text;
}
@property (nonatomic, retain) IBOutlet UISlider * sliderNum;
@property (nonatomic, retain) IBOutlet UITextField * rotorNum;
@property (nonatomic, retain) IBOutlet UITextField * rotorConfig;
@property (nonatomic, copy) NSString * text;

- (IBAction)numRotors:(id)sender;
- (IBAction)textValueChanged:(id)sender;
- (IBAction)RotorConfigChanged:(id)sender;
- (IBAction)UpperCase:(id)sender;
@end
