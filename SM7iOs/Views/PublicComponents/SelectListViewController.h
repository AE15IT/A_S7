//
//  SelectListViewController.h
//  SM7iOs
//
//  Created by Black on 11-9-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


#define IncidentField_Group     @"iGroup"
#define IncidentField_Assginee  @"iAssignee"
#define IncidentField_Status    @"iStatus"

#define ChangeField_Group       @"cGroup"
#define ChangeField_Coordinator @"cCoordinator"
#define ChangeField_Status      @"cStatus"


@protocol SelectListViewControllerDelegate

- (void)selectFinishedWithValue:(NSString *)value forField:(NSString *)field;

@end

@interface SelectListViewController : UITableViewController
{
    id<SelectListViewControllerDelegate> delegate;
    
    NSArray *dataSource;
    NSString *field;
    
    //---If NO, 'None' will appear at first row in the select list, default is NO---
    BOOL atLeastOne;    
}

@property (nonatomic, assign) id<SelectListViewControllerDelegate> delegate;
@property (nonatomic, retain) NSArray *dataSource;
@property (nonatomic, retain) NSString *field;
@property (nonatomic, assign) BOOL atLeastOne;

@end


