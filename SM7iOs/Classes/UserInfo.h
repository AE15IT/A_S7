//
//  UserInfo.h
//  SM7iOs
//
//  Created by Black on 11-9-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUserNameKey        @"username"
#define kPassWordKey        @"password"
#define kCheckBoxKey        @"checkbox"
#define kServerUrlKey       @"serverurl"
#define kAutoUpdateKey      @"autoupdate"
#define kDisplayKey         @"display"


@interface UserInfo : NSObject {
    
}

+ (NSString *)filePath;

@end
