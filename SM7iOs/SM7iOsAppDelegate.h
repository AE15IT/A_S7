//
//  SM7iOsAppDelegate.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;
@class SettingViewController;

@interface SM7iOsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LoginViewController *loginCtrl;
@property (nonatomic, retain) IBOutlet UITabBarController  *homeCtrl;
@property (nonatomic, retain) IBOutlet SettingViewController *settingCtrl;

- (void)logOn;
- (void)logOut;
- (void)setting;

@end
