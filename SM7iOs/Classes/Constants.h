//
//  Constants.h
//  SM7iOs
//
//  Created by eleven li on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#pragma mark - Constants

#define TableView_BackgroundColor   [UIColor colorWithRed:29.0/255 green:30.0/255 blue:30.0/255 alpha:1.0]
#define TableView_SeparatorColor    [UIColor colorWithRed:36.0/255 green:37.0/255 blue:37.0/255 alpha:1.0]
#define Label_BlueColor             [UIColor colorWithRed:42.0/255 green:211.0/255 blue:242.0/255 alpha:1.0]
#define TableCell_AccessoryArrow    [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_arrow.png"]] autorelease]

#pragma mark - Enums

//---Row Index of Change---
typedef enum{
    ChangeSearchRowIndexSearch = 0,
    ChangeSearchRowIndexCategory,
    ChangeSearchRowIndexPhase,
    ChangeSearchRowIndexGroup,
    ChangeSearchRowIndexCoordinator,
    ChangeSearchRowIndexApprovalStatus,
    ChangeSearchRowIndexMyChanges,
    ChangeSearchRowIndexGroupChanges
}ChangeSearchRowIndex;

typedef enum{
    ChangeDetailRowIndexNumber = 0,
    ChangeDetailRowIndexPriority,
    ChangeDetailRowIndexCategory,
    ChangeDetailRowIndexPhase,
    ChangeDetailRowIndexGroup,
    ChangeDetailRowIndexCoordinator,
    ChangeDetailRowIndexApprovalStatus,
    ChangeDetailRowIndexTitle,
    ChangeDetailRowIndexDescription,
}ChangeDetailRowIndex;

//---Row Index of Incident---
typedef enum{
    IncidentSearchRowIndexSearch = 0,
    IncidentSearchRowIndexGroup,
    IncidentSearchRowIndexAssignee,
    IncidentSearchRowIndexStatus,
}IncidentSearchRowIndex;

typedef enum{
    IncidentDetailRowIndexTicketNumber = 0,
    IncidentDetailRowIndexPriority,
    IncidentDetailRowIndexAssignment,
    IncidentDetailRowIndexAssignee,
    IncidentDetailRowIndexStatus,
    IncidentDetailRowIndexTitle,
    IncidentDetailRowIndexDescription,
    IncidentDetailRowIndexJournalUpdate,
    IncidentDetailRowIndexClosureCode,
    IncidentDetailRowIndexClosureComments
}IncidentDetailRowIndex;