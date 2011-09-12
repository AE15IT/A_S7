//
//  DashboardViewController.m
//  SM7iOs
//
//  Created by Black on 11-9-9.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DashboardViewController.h"
#import "SM7iOsAppDelegate.h"
#import "IncidentViewController.h"


@implementation DashboardViewController

- (void)logout
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure want to logout?" 
                                                             delegate:self 
                                                    cancelButtonTitle:@"Cancel" 
                                               destructiveButtonTitle:@"Logout" 
                                                    otherButtonTitles:nil];
    [actionSheet showInView:self.view.superview];
    [actionSheet release];
}

- (void)dealloc
{
    [myList release];
    [myGroupsList release];
    [myCompanyList release];
    [dashboardList release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.scrollEnabled = NO;
    
    self.navigationItem.title = @"Freedom: HOME";
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
    
    UIBarButtonItem *btnLogout = [[UIBarButtonItem alloc] initWithTitle:@"Logout" 
                                                                  style:UIBarButtonItemStyleBordered 
                                                                 target:self 
                                                                 action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = btnLogout;
    [btnLogout release];
  
    myList = [[NSArray alloc] initWithObjects:@"Incidents", @"Changes Awaiting My Approval", nil];
    myGroupsList = [[NSArray alloc] initWithObjects:@"Incidents", @"Changes", nil];
    myCompanyList = [[NSArray alloc] initWithObjects:@"Search Incidents", @"Search Changes", nil];
    dashboardList = [[NSArray alloc] initWithObjects:myList, myGroupsList, myCompanyList, nil];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dashboardList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[dashboardList objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 48.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;
    switch (section) {
        case sectionIndexMy:
            title = @"My";
            break;
        case sectionIndexMyGroups:
            title = @"My Groups";
            break;
        case sectionIndexMyCompany:
            title = @"My Company";
            break;
        default:
            break;
    }
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    cell.textLabel.text = [[dashboardList objectAtIndex:section] objectAtIndex:row];

//TODO: Calculate the actual number.
    switch (section) {
        case sectionIndexMy:
            if (row == rowIndexIncident)
                cell.detailTextLabel.text = [NSString stringWithFormat:@"(0)"];
            else if (row == rowIndexChange)
                cell.detailTextLabel.text = [NSString stringWithFormat:@"(100)"];
            break;
        case sectionIndexMyGroups:
            if (row == rowIndexIncident)
                cell.detailTextLabel.text = [NSString stringWithFormat:@"(0)"];
            else if (row == rowIndexChange)
                cell.detailTextLabel.text = [NSString stringWithFormat:@"(0)"];
            break;     
        default:
            break;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
//TODO: Perform the select function here.    
    switch (section) {
        case sectionIndexMy:
//            if (row == rowIndexIncident)
//                
//            else if (row == rowIndexChange)
                
            break;
        case sectionIndexMyGroups:
//            if (row == rowIndexIncident)
//                
//            else if (row == rowIndexChange)
                
            break;
        case sectionIndexMyCompany:
            if (row == rowIndexIncident)
            {
                IncidentViewController *searchIncidentCtrl = [[IncidentViewController alloc] init];
                [self.navigationController pushViewController:searchIncidentCtrl animated:YES];
                [searchIncidentCtrl release];
            }
//            else if (row == rowIndexChange)
//                cell.detailTextLabel.text = [NSString stringWithFormat:@"(0)"];
            break;
        default:
            break;
    }   
}

#pragma mark - Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        SM7iOsAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate logOut];
    }
}

@end
