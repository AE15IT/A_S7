//
//  ActionCloseViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Combobox;

@interface ActionCloseViewController : UIViewController <UITextFieldDelegate>{
    NSDictionary *dataSource;
    
    IBOutlet UILabel *ticketNumberLabel;
    IBOutlet UITextView *closureComment;
    
    UIButton *btnClose;
    Combobox *closureCodeCombobox;
}

@property (nonatomic, retain) NSDictionary *dataSource;

@end
