//
//  IncidentViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectListViewController.h"



@interface IncidentViewController : UITableViewController <UITextFieldDelegate, SelectListViewControllerDelegate>{
    UITextField *txtSearch;
    UILabel *lblGroup;
    UILabel *lblAssignee;
    UILabel *lblStatus;
    
    NSArray *groupList;
    NSArray *assigneeList;
    NSArray *statusList;   
}

@property (nonatomic, retain) UITextField *txtSearch;
@property (nonatomic, retain) UILabel *lblGroup;
@property (nonatomic, retain) UILabel *lblAssignee;
@property (nonatomic, retain) UILabel *lblStatus;
@property (nonatomic, retain) NSArray *groupList;
@property (nonatomic, retain) NSArray *assigneeList;
@property (nonatomic, retain) NSArray *statusList;

- (void)search;

@end
