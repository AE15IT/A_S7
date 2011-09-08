//
//  IncidentDetailViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IncidentResultViewController.h"

#define kKeyLabelTag    1
#define kValueLabelTag  2

@interface IncidentDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSDictionary *tableDataSource;
    
    CGFloat cellHeight;
    
    UIButton *btnUpdate;
    UIButton *btnResolve;
    UIButton *btnClose;
}

@property (nonatomic, retain) NSDictionary *tableDataSource;

- (void)updateButtonPressed;
- (void)resolveButtonPressed;
- (void)closeButtonPressed;


@end
