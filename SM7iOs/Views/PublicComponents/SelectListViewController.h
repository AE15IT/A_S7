//
//  SelectListViewController.h
//  SM7iOs
//
//  Created by Black on 11-9-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


#define IncidentField_Group     @"Group"
#define IncidentField_Assginee  @"Assignee"
#define IncidentField_Status    @"Status"

#define ChangeField_Group       @"Group"
#define ChangeField_Coordinator @"Coordinator"
#define ChangeField_Status      @"Status"


@protocol SelectListViewControllerDelegate

- (void)selectFinishedWithValue:(NSString *)value forField:(NSString *)field;

@end

@interface SelectListViewController : UITableViewController
{
    id<SelectListViewControllerDelegate> delegate;
    NSArray *dataSource;
    NSString *field;
}

@property (nonatomic, assign) id<SelectListViewControllerDelegate> delegate;
@property (nonatomic, retain) NSArray *dataSource;
@property (nonatomic, retain) NSString *field;

@end
