//
//  LoginUserData.h
//  SM7iOs
//
//  Created by Black on 11-7-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLoginData          @"loginData.plist"
#define kSettingData        @"settingData.plist"

#define kCheckBoxKey        @"savePassword"
#define kServerAddressKey   @"serverAddress"

@interface LoginUserData : NSObject {
    
}

+ (NSString *)dataFilePath: (NSString *)plistName;

@end
