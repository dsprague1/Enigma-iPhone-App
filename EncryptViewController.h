//
//  EncryptViewController.h
//  Enigmatic
//
//  Created by Davis on 2/14/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Rotorbox.h"

@interface EncryptViewController : UIViewController
{
    IBOutlet UITextView * userInput;
    IBOutlet UITextField * setPermutations;
    IBOutlet UISegmentedControl * EncryptSelect;
}

@property (nonatomic, retain) IBOutlet UITextView * userInput;
@property (nonatomic, retain) IBOutlet UITextField * setPermutations;
@property (nonatomic, retain) IBOutlet UISegmentedControl * EncryptSelect;
@property(nonatomic) int permutationNumber;

- (double) factorialWithValue:(double)val;
- (IBAction) modifySegmentControl:(id)sender;
- (IBAction) generateKey:(id)sender;

@end
