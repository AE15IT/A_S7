//
//  ActionUpdateViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ActionUpdateViewController : UIViewController {
    NSDictionary *dataSource;
    
    IBOutlet UILabel *ticketNumberLabel;
    IBOutlet UITextView *journalUpdate; 
    
    UIButton *btnUpdate;
}

@property (nonatomic, retain) NSDictionary *dataSource;

@end
