//
//  DashboardViewController.h
//  SM7iOs
//
//  Created by Black on 11-9-9.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    sectionIndexMy = 0,
    sectionIndexMyGroups = 1,
    sectionIndexMyCompany = 2
}sectionIndex;

typedef enum {
    rowIndexIncident = 0,
    rowIndexChange = 1
}rowIndex;


@interface DashboardViewController : UITableViewController <UIActionSheetDelegate>{
    NSArray *myList;
    NSArray *myGroupsList;
    NSArray *myCompanyList;
    NSArray *dashboardList;
}
//TODO: Design the data model of my or myGroups.

- (void)logout;

@end
