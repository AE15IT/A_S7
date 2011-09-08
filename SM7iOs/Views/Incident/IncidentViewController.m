//
//  IncidentViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "IncidentViewController.h"
#import "IncidentResultViewController.h"
#import "SM7iOsAppDelegate.h"
#import "Combobox.h"
#import "CommonFuns.h"
#import "Constants.h"

@implementation IncidentViewController

@synthesize txtSearch;
@synthesize searchConditions;

#pragma mark -

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

//TODO: Not implement yet
- (void)search
{ 
    IncidentResultViewController *childController = [[IncidentResultViewController alloc] init];
    [self.navigationController pushViewController:childController animated:YES];
    [childController release];
}

#pragma mark - Initialize custom views

- (UILabel *)initLeftLabelWithText:(NSString *)text
{
    UILabel *Label = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, 110, 40)];
    Label.backgroundColor = [UIColor clearColor];
    Label.textColor = [UIColor whiteColor];
    Label.font = [UIFont systemFontOfSize:14]; 
    Label.text = text;
    
    return Label;
}

#pragma mark - View lifecycle

- (void)dealloc
{
    [txtSearch release];
    [searchConditions release];
    [assignmentCombobox release];
    [assigneeCombobox release];
    [statusCombobox release];
    [super dealloc];
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"Incident Management";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *btnLogout = [[UIBarButtonItem alloc] initWithTitle:@"Logout" 
                                                                  style:UIBarButtonItemStyleBordered 
                                                                 target:self 
                                                                 action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = btnLogout;
    [btnLogout release];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
    
    //---pseudo data---
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableArray *groups = [[NSMutableArray alloc] initWithObjects:@"Appliction",@"Hardware",@"Network", nil];
    NSMutableArray *operators = [[NSMutableArray alloc] initWithObjects:@"Incident.Manager",@"falcon",@"Incident.Coordinator", nil];
    NSMutableArray *status = [[NSMutableArray alloc] initWithObjects:@"Update", @"Resloved", @"Closed", nil];
    
    [array addObject:groups];
    [array addObject:operators];
    [array addObject:status];
    [groups release];
    [operators release];
    [status release];
    
    searchConditions = array;
   
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

//- (void)viewWillAppear:(BOOL)animated
//{NSLog(@"viewwillappear");
//    [super viewWillAppear:animated];
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
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
            case IncidentSearchRowIndexAssignment:
            {
                UILabel *label = [self initLeftLabelWithText:@"Assignment GP:"];
                [cell.contentView addSubview:label];
                [label release];
                
                assignmentCombobox = [[Combobox alloc] initComboboxWithFrame:CGRectMake(150, 2, 170, 40) 
                                                               dataSource:[searchConditions objectAtIndex:(indexPath.row - 1)]];

                [cell.contentView addSubview:assignmentCombobox];

                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            }
            case IncidentSearchRowIndexAssignee:
            {
                UILabel *label = [self initLeftLabelWithText:@"Assignee:"];
                [cell.contentView addSubview:label];
                [label release];
                
                assigneeCombobox = [[Combobox alloc] initComboboxWithFrame:CGRectMake(150, 2, 170, 40) 
                                                                dataSource:[searchConditions objectAtIndex:(indexPath.row - 1)]];
                [cell.contentView addSubview:assigneeCombobox];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            }
            case IncidentSearchRowIndexStatus:
            {
                UILabel *label = [self initLeftLabelWithText:@"Status:"];
                [cell.contentView addSubview:label];
                [label release];
                
                statusCombobox = [[Combobox alloc] initComboboxWithFrame:CGRectMake(150, 2, 170, 40) 
                                                              dataSource:[searchConditions objectAtIndex:(indexPath.row - 1)]];
                [cell.contentView addSubview:statusCombobox];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            }
//TODO: detailTextLabel.text should set to the count of incidents
            case IncidentSearchRowIndexMyIncidents:
                cell.textLabel.text = @"My Incidents";
                cell.detailTextLabel.text = @"(0)";
                cell.accessoryView = TableCell_AccessoryArrow;
                break;
            case IncidentSearchRowIndexMyGroupIncidents:
                cell.textLabel.text = @"My Group's Incidents";
                cell.detailTextLabel.text = @"(0)";
                cell.accessoryView = TableCell_AccessoryArrow;
                break;
            default:
                break;
        }     
    }
    cell.textLabel.textColor = Label_BlueColor;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    cell.detailTextLabel.textColor = Label_BlueColor;
    cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:14];

    tableView.separatorColor = TableView_SeparatorColor;
    tableView.backgroundColor = TableView_BackgroundColor;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != IncidentSearchRowIndexSearch)
        [txtSearch resignFirstResponder];
    
//TODO: implements the real My Incidents and My Group's Incidents functions
    if (indexPath.row == IncidentSearchRowIndexMyIncidents || indexPath.row == IncidentSearchRowIndexMyGroupIncidents) {
        [self search];
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
