//
//  ActionDenyViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"


@interface ActionDenyViewController : UIViewController {
    UILabel *lblTicketNum;
    UITextView *txtDenyReasonView;
    Ticket *ticket;
    //UIButton *btnDeny;
}
@property (nonatomic, retain) IBOutlet UILabel *lblTicketNum;
@property (nonatomic, retain) IBOutlet UITextView *txtDenyReasonView;
@property (nonatomic, retain) Ticket *ticket;
@property (nonatomic, retain) IBOutlet UIButton *btnDeny;

- (IBAction)backgroundTapped;

@end
