//
//  UserInfo.m
//  SM7iOs
//
//  Created by Black on 11-9-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo

+ (NSString *)filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"userInfo.plist"];
}

@end
