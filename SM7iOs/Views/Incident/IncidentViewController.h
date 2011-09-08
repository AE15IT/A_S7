//
//  IncidentViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Combobox;

@interface IncidentViewController : UITableViewController <UITextFieldDelegate, UIActionSheetDelegate>{
    UITextField *txtSearch;
//TBD:
    NSArray *searchConditions;
    
    Combobox *assignmentCombobox;
    Combobox *assigneeCombobox;
    Combobox *statusCombobox;
}

@property (nonatomic, retain) UITextField *txtSearch;
@property (nonatomic, retain) NSArray *searchConditions;

- (void)search;
- (void)logout;

@end
