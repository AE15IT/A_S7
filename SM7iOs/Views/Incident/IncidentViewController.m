//
//  IncidentViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "IncidentViewController.h"
#import "IncidentResultViewController.h"
#import "CommonFuns.h"
#import "Constants.h"


@implementation IncidentViewController

@synthesize txtSearch;
@synthesize lblGroup;
@synthesize lblAssignee;
@synthesize lblStatus;
@synthesize groupList;
@synthesize assigneeList;
@synthesize statusList;


#pragma mark -

//TODO: Not implement yet
- (void)search
{ 
    IncidentResultViewController *childController = [[IncidentResultViewController alloc] init];
    [self.navigationController pushViewController:childController animated:YES];
    [childController release];
}

#pragma mark - View lifecycle

- (void)dealloc
{
    [txtSearch release];
    [lblGroup release];
    [lblAssignee release];
    [lblStatus release];
    [groupList release];
    [assigneeList release];
    [statusList release];

    [super dealloc];
}

- (void)viewDidLoad
{
    self.tableView.scrollEnabled = NO;
    self.navigationItem.title = @"My Company Incidents";
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
    
    //---pseudo data---
    
    NSMutableArray *groups = [NSMutableArray array];  
    NSMutableArray *assignees = [[NSMutableArray alloc] init];
    NSMutableArray *statuses = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i ++)
    {
        NSString *group = [NSString stringWithFormat:@"Group %d", i];
        [groups addObject:group];
        NSString *assignee = [NSString stringWithFormat:@"Assignee %d", i];
        [assignees addObject:assignee];
        NSString *status = [NSString stringWithFormat:@"Status %d", i];
        [statuses addObject:status];
    }
    self.groupList = groups;   
    self.assigneeList = assignees;
    self.statusList = statuses;
   
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.txtSearch = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 
                                       reuseIdentifier:CellIdentifier] autorelease];
        switch (indexPath.row) {
            case IncidentSearchRowIndexSearch:
                txtSearch = [CommonFuns newTxtSearchWithTarget:self action:@selector(search)];
                [cell.contentView addSubview:txtSearch];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            case IncidentSearchRowIndexGroup:
                cell.textLabel.text = @"Groups:";
                cell.detailTextLabel.text = @"Please Select";
                self.lblGroup = cell.detailTextLabel;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case IncidentSearchRowIndexAssignee:
                cell.textLabel.text = @"Assignee:";
                cell.detailTextLabel.text = @"Please Select";
                self.lblAssignee = cell.detailTextLabel;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case IncidentSearchRowIndexStatus:
                cell.textLabel.text = @"Status:";
                cell.detailTextLabel.text = @"Please Select";
                self.lblStatus = cell.detailTextLabel;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            default:
                break;
        }     
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != IncidentSearchRowIndexSearch)
        [txtSearch resignFirstResponder];
    
    if (indexPath.row == IncidentSearchRowIndexGroup)
    {
        SelectListViewController *selectCtrl = [[SelectListViewController alloc] initWithStyle:UITableViewStyleGrouped];
        selectCtrl.delegate = self;
        selectCtrl.dataSource = groupList;
        selectCtrl.field = IncidentField_Group;
        [self.navigationController pushViewController:selectCtrl animated:YES];
    }
    else if (indexPath.row == IncidentSearchRowIndexAssignee)
    {
        SelectListViewController *selectCtrl = [[SelectListViewController alloc] initWithStyle:UITableViewStyleGrouped];
        selectCtrl.delegate = self;
        selectCtrl.dataSource = assigneeList;
        selectCtrl.field = IncidentField_Assginee;
        [self.navigationController pushViewController:selectCtrl animated:YES];
    }
    else if (indexPath.row == IncidentSearchRowIndexStatus)
    {
        SelectListViewController *selectCtrl = [[SelectListViewController alloc] initWithStyle:UITableViewStyleGrouped];
        selectCtrl.delegate = self;
        selectCtrl.dataSource = statusList;
        selectCtrl.field = IncidentField_Status;
        [self.navigationController pushViewController:selectCtrl animated:YES];
    }
        
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == IncidentSearchRowIndexSearch)
        return 56.0f;
    else 
        return 48.0f;
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    //---peform search---
    [self search];
    return YES;
}

- (void)selectFinishedWithValue:(NSString *)value forField:(NSString *)field
{
    if ([field isEqualToString:IncidentField_Group])
        lblGroup.text = value;
    else if ([field isEqualToString:IncidentField_Assginee])
        lblAssignee.text = value;
    else if ([field isEqualToString:IncidentField_Status])
        lblStatus.text = value;
}

@end
