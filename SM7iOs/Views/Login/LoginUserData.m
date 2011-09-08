//
//  LoginUserData.m
//  SM7iOs
//
//  Created by Black on 11-7-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LoginUserData.h"

@implementation LoginUserData

+ (NSString *) dataFilePath: (NSString *)plistName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:plistName];
}

@end
