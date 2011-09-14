//
//  SettingViewController.h
//  SM7iOs
//
//  Created by Black on 11-7-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface SettingViewController : UIViewController 
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, MBProgressHUDDelegate>
{
    UITextField *txtServerAddress;
    UISwitch *swhAutoUpdate;
    MBProgressHUD *HUD;
    
    BOOL useAnimation;
}

@property (nonatomic, retain) UITextField *txtServerAddress;
@property (nonatomic, retain) UISwitch *swhAutoUpdate;
@property (nonatomic, assign) BOOL useAnimation;

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;
- (void)testServerAddress;

@end
