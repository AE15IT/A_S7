//
//  IncidentResultViewController.h
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTicketNumberKey    @"TicketNumber"
#define kPriorityKey        @"Priority"
#define kAssignmentGPKey    @"Assignment"
#define kAssigneeKey        @"Assignee"
#define kStatusKey          @"Status"
#define kTitleKey           @"Title"
#define kDescriptionKey     @"Description"
#define kJournalUpdateKey   @"JournalUpdate"
#define kClosureCodeKey     @"ClosureCode"
#define kClosureCommentsKey @"ClosureComments"

#define kTicketNumberTag    1
#define kPriorityTag        2
#define kAssignmentGPTag    3
#define kAssigneeTag        4
#define kStatusTag          5
#define kDescriptionTag     6

@interface IncidentResultViewController : UITableViewController {
    NSArray *dataArray;
    
    UILabel *ticketNumberLabel;
    UILabel *priorityLabel;
    UILabel *assignmentLabel;
    UILabel *assigneeLabel;
    UILabel *statusLabel;
    UILabel *descriptionLabel;
}

@property (nonatomic, retain) NSArray *dataArray;

@end
