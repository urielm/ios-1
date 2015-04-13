//
//  PasscodeDto.h
//  Owncloud iOs Client
//
//  Created by Javier Gonzalez on 13/4/15.
//
//

#import <Foundation/Foundation.h>

@interface PasscodeDto : NSObject

@property NSInteger idPasscode;
@property (nonatomic, copy) NSString *passcode;
@property BOOL isPasscodeEntered;

@end
