//
//  LoginViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@class LoginCheckBox;

@interface LoginViewController : UIViewController <UITextFieldDelegate, MBProgressHUDDelegate>{
    UITextField *txtUserName;
    UITextField *txtPassword;
    UIButton *btnLogin;
    UIButton *btnSetting;
    
    //---Indicate should save password or not---
    BOOL shouldChecked;
    
    LoginCheckBox *checkBox;
    MBProgressHUD *HUD;
}

@property (nonatomic, retain) UITextField *txtUserName;
@property (nonatomic, retain) UITextField *txtPassword;
@property (nonatomic, retain) IBOutlet UIButton *btnLogin;
@property (nonatomic, retain) IBOutlet UIButton *btnSetting;
@property (nonatomic, retain) LoginCheckBox *checkBox;

- (IBAction)login;
- (IBAction)setting;

@end
