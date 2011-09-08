//
//  ActionApproveViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface ActionApproveViewController : UIViewController {
    UILabel *lblTicketNum;
    UITextView *txtDescView;
    Ticket *ticket;
}

@property (nonatomic ,retain) Ticket *ticket;
@property (nonatomic, retain) IBOutlet UILabel *lblTicketNum;
@property (nonatomic, retain) IBOutlet UITextView *txtDescView;
@property (nonatomic, retain) IBOutlet UIButton *btnApprove;

@end
