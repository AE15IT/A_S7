//
//  ChangeViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Combobox;

@interface ChangeViewController : UITableViewController<UITextFieldDelegate, UIActionSheetDelegate> {
    int myChanges;
    int groupChanges;
    
    Combobox *groupCombobox;
    Combobox *coordinatorCombobox;
    Combobox *approvalStatusCombobox;
    
    NSArray *searchConditions;
}

@property (nonatomic, retain) UITextField *txtTicket;
@property (nonatomic, retain) UITextField *txtCategery;
@property (nonatomic, retain) UITextField *txtPhase;


//@property (nonatomic, assign) NSArray *dsChanges;
@property (nonatomic, assign) NSArray *searchConditions;

@end
