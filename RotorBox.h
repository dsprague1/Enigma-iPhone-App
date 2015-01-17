//
//  RotorBox.h
//  Enigmatic
//
//  Created by Davis on 2/15/14.
//  Copyright (c) 2014 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Letter.h"
#import "Rotor.h"

@interface RotorBox : NSObject
{
    NSMutableArray * m_gearbox;
    NSNumber * m_i_num_rotors;
    NSMutableArray * m_rotor_connetions;
}
@property (nonatomic, retain) NSMutableArray * m_gearbox;
@property (nonatomic, retain) NSNumber * m_i_num_rotors;
@property (nonatomic, retain) NSMutableArray * m_rotor_connections;

- (id) initWithGearbox:(NSMutableArray*)box Connections:(NSMutableArray*)conns num_rotors:(NSNumber*)n_r;

- (void) reflector:(Rotor *)reflect;

- (NSMutableString *) plugboard:(NSMutableString *)input;

- (NSMutableString *) encrypt:(NSMutableString *)input;
- (void) newRotors:(NSMutableArray*)rBox Connections:(NSMutableArray*)conns;
@end
