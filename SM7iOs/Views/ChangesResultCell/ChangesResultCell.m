//
//  ChangesResultCell.m
//  SM7iOs
//
//  Created by eleven li on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChangesResultCell.h"
#import "Ticket.h"

@implementation ChangesResultCell

@synthesize lblTicketNum;
@synthesize lblPriorty;
@synthesize lblCc;
@synthesize lblGroup;
@synthesize lblStatus;
@synthesize lblDescription;
@synthesize lblCategory;
@synthesize lblPhase;

#pragma mark - Cell methods

- (void)setCellContentWithTicket:(Ticket *)ticket{
    lblTicketNum.text = ticket.num;
    lblPriorty.text = ticket.priorty;
    lblGroup.text = ticket.group;
    lblCc.text = ticket.cc;
    lblStatus.text = ticket.status;
    lblDescription.text = ticket.desc;
    lblCategory.text = ticket.category;
    lblPhase.text = ticket.phase;
}

- (void)dealloc
{
    [lblCategory release];
    [lblPhase release];
    [lblTicketNum release];
    [lblPriorty release];
    [lblStatus release];
    [lblCc release];
    [lblGroup release];
    [lblDescription release];
    
    [super dealloc];
}

@end
