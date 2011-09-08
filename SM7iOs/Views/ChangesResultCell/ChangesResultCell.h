//
//  ChangesResultCell.h
//  SM7iOs
//
//  Created by eleven li on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface ChangesResultCell : UITableViewCell {
    UILabel *lblTicketNum;
    UILabel *lblPriorty;
    UILabel *lblGroup;
    UILabel *lblCc;
    UILabel *lblStatus;
    UILabel *lblDescription;
    UILabel *lblCategory;
    UILabel *lblPhase;
}

@property (nonatomic, retain) IBOutlet UILabel *lblTicketNum;
@property (nonatomic, retain) IBOutlet UILabel *lblPriorty;
@property (nonatomic, retain) IBOutlet UILabel *lblGroup;
@property (nonatomic, retain) IBOutlet UILabel *lblCc;
@property (nonatomic, retain) IBOutlet UILabel *lblStatus;
@property (nonatomic, retain) IBOutlet UILabel *lblDescription;
@property (nonatomic, retain) IBOutlet UILabel *lblCategory;
@property (nonatomic, retain) IBOutlet UILabel *lblPhase;

- (void)setCellContentWithTicket:(Ticket *)ticket;

@end
