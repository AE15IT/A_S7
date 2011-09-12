//
//  IncidentDetailViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "IncidentDetailViewController.h"
#import "ActionUpdateViewController.h"
#import "ActionResolveViewController.h"
#import "ActionCloseViewController.h"
#import "CommonFuns.h"
#import "Constants.h"


@implementation IncidentDetailViewController

@synthesize tableDataSource;


#pragma mark - Actions

- (void)updateButtonPressed
{
    ActionUpdateViewController *childController = [[ActionUpdateViewController alloc] initWithNibName:@"ActionUpdateViewController" bundle:nil];
    childController.dataSource = tableDataSource;
    [self.navigationController pushViewController:childController animated:YES];
    [childController release];
}

- (void)resolveButtonPressed
{
    ActionResolveViewController *childController = [[ActionResolveViewController alloc] initWithNibName:@"ActionResolveViewController" bundle:nil];
    childController.dataSource = tableDataSource;
    [self.navigationController pushViewController:childController animated:YES];
    [childController release];
}

- (void)closeButtonPressed
{
    ActionCloseViewController *childController = [[ActionCloseViewController alloc] initWithNibName:@"ActionCloseViewController" bundle:nil];
    childController.dataSource = tableDataSource;
    [self.navigationController pushViewController:childController animated:YES];
    [childController release];
}

- (void)dealloc
{
    [tableDataSource release];
    [btnUpdate release];
    [btnResolve release];
    [btnClose release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.navigationItem.title = [NSString stringWithFormat:@"%@ Detail",[tableDataSource objectForKey:kTicketNumberKey]];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
    
    btnUpdate = [CommonFuns newActionButtonWithTitle:@"Update" frame:CGRectMake(2, 379, 103, 37)];
    [btnUpdate addTarget:self action:@selector(updateButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnUpdate];
    
    btnResolve = [CommonFuns newActionButtonWithTitle:@"Reslove" frame:CGRectMake(107, 379, 106, 37)];
    [btnResolve addTarget:self action:@selector(resolveButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnResolve];
    
    btnClose = [CommonFuns newActionButtonWithTitle:@"Close" frame:CGRectMake(215, 379, 103, 37)];
    [btnClose addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(18, 5, 284, 16)];
        label1.backgroundColor = [UIColor clearColor];
        label1.textColor = [UIColor lightGrayColor];
        label1.font = [UIFont italicSystemFontOfSize:13];
        label1.tag = kKeyLabelTag;
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(32, 24, 256, 20)];
        label2.backgroundColor = [UIColor clearColor];
        label2.textColor = [UIColor whiteColor];
        label2.font = [UIFont systemFontOfSize:14];
        label2.tag = kValueLabelTag;

        [cell.contentView addSubview:label1];
        [cell.contentView addSubview:label2];
        [label1 release];
        [label2 release];
    }
    
    UILabel *keyLabel = (UILabel *)[cell.contentView viewWithTag:kKeyLabelTag];
    UILabel *valueLabel = (UILabel *)[cell.contentView viewWithTag:kValueLabelTag];
    
    switch (indexPath.row) {
        case IncidentDetailRowIndexTicketNumber:
            keyLabel.text = @"Ticket #:";
            valueLabel.text = [tableDataSource objectForKey:kTicketNumberKey];
            break;
        case IncidentDetailRowIndexPriority:
            keyLabel.text = @"Priority:";
            valueLabel.text = [tableDataSource objectForKey:kPriorityKey];
            break;
        case IncidentDetailRowIndexAssignment:
            keyLabel.text = @"Assignment GP:";
            valueLabel.text = [tableDataSource objectForKey:kAssignmentGPKey];
            break;
        case IncidentDetailRowIndexAssignee:
            keyLabel.text = @"Assignee:";
            valueLabel.text = [tableDataSource objectForKey:kAssigneeKey];
            break;
        case IncidentDetailRowIndexStatus:
            keyLabel.text = @"Status:";
            valueLabel.text = [tableDataSource objectForKey:kStatusKey];
            break;
        case IncidentDetailRowIndexTitle:
            keyLabel.text = @"Title:";
            valueLabel.text = [tableDataSource objectForKey:kTitleKey];
            break;
        case IncidentDetailRowIndexDescription:
            keyLabel.text = @"Description:";
            valueLabel.text = [tableDataSource objectForKey:kDescriptionKey];
            break;
        case IncidentDetailRowIndexJournalUpdate:
            keyLabel.text = @"Journal Update:";
            valueLabel.text = [tableDataSource objectForKey:kJournalUpdateKey];
            break;
        case IncidentDetailRowIndexClosureCode:
            keyLabel.text = @"Closure Code:";
            valueLabel.text = [tableDataSource objectForKey:kClosureCodeKey];
            break;
        case IncidentDetailRowIndexClosureComments:
            keyLabel.text = @"Closure Comments:";
            valueLabel.text = [tableDataSource objectForKey:kClosureCommentsKey];
            break;
        default:
            break;
    }
    valueLabel.numberOfLines = 0; //no limit
    
    CGSize size = CGSizeMake(256, MAXFLOAT);
    CGSize labelSize = [valueLabel.text sizeWithFont:valueLabel.font 
                              constrainedToSize:size
                                  lineBreakMode:UILineBreakModeWordWrap];
    valueLabel.frame = CGRectMake(valueLabel.frame.origin.x, valueLabel.frame.origin.y,
                                  valueLabel.frame.size.width, labelSize.height);
    
    if (valueLabel.frame.size.height > 20) {
        cellHeight = 29.0 + valueLabel.frame.size.height;
    }
    else
        cellHeight = 49.0;

    tableView.separatorColor = [UIColor colorWithRed:36.0/255 green:37.0/255 blue:37.0/255 alpha:1.0];
    tableView.backgroundColor = [UIColor colorWithRed:29.0/255 green:30.0/255 blue:30.0/255 alpha:1.0];

    cell.selectionStyle = UITableViewCellEditingStyleNone;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //---get the cell frame size first---
    [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cellHeight;
}

@end
