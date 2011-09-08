//
//  ChangeDetailViewController.h
//  SM7iOs
//
//  Created by eleven li on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface ChangeDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    Ticket *ticket;
    UIButton *btnApprove;
    UIButton *btnDeny;
    CGFloat cellHeight;
}

@property (nonatomic, retain) Ticket *ticket;
@property (nonatomic, retain) IBOutlet UIButton *btnApprove;
@property (nonatomic, retain) IBOutlet UIButton *btnDeny;

- (void)approveButtonClicked;
- (void)denyButtonClicked;

@end
