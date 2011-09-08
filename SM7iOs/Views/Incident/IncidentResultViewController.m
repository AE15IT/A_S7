//
//  IncidentResultViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "IncidentResultViewController.h"
#import "IncidentDetailViewController.h"
#import "Constants.h"

@implementation IncidentResultViewController

@synthesize dataArray;

- (UILabel *)newLabelWithFrame:(CGRect)frame 
                     textColor:(UIColor *)color 
                          font:(UIFont *)font 
                 textAlignment:(UITextAlignment)textAlignment 
                           tag:(NSInteger)tag
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color;
    label.font = font;
    label.textAlignment = textAlignment;
    label.tag = tag;
    
    return label;
}

- (void)dealloc
{
    [dataArray release];
    [ticketNumberLabel release];
    [priorityLabel release];
    [assignmentLabel release];
    [assigneeLabel release];
    [statusLabel release];
    [descriptionLabel release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.tableView.separatorColor = TableView_SeparatorColor;
    self.tableView.backgroundColor = TableView_BackgroundColor;

    self.navigationItem.title = @"Search Result";
    
    //---pseudo data---
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 99; i++) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:[NSString stringWithFormat:@"IM100%d",i] forKey:kTicketNumberKey];
        [dict setObject:@"Application" forKey:kAssignmentGPKey];
        [dict setObject:@"2 - High" forKey:kPriorityKey];
        [dict setObject:@"Incident.Manager" forKey:kAssigneeKey];
        [dict setObject:@"Work In Progress" forKey:kStatusKey];
        [dict setObject:@"Virus scan report Multiple Virusse.test if it can display" forKey:kTitleKey];
        [dict setObject:@"Virus scan report Multiple Virusse. TTTTTTTTTTTTTTTTTTTTTTTT" forKey:kDescriptionKey];
        [dict setObject:@"Updated by falcon.######" forKey:kJournalUpdateKey];        
        [dict setObject:@"Solved by User Instruction" forKey:kClosureCodeKey];
        [dict setObject:@"Solved by User Instruction on Dec. 12" forKey:kClosureCommentsKey];
        [array addObject:dict];
        [dict release];
    }
    dataArray = array;

    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lblCounter = [[[UILabel alloc] init] autorelease];
    lblCounter.font = [UIFont boldSystemFontOfSize:11];
    lblCounter.textColor = [UIColor lightGrayColor];
    lblCounter.textAlignment = UITextAlignmentCenter;
    lblCounter.backgroundColor = [UIColor colorWithRed:42.0/255 green:42.0/255 blue:42.0/255 alpha:0.95];
    
    lblCounter.text = [NSString stringWithFormat:@"Total : %d", [dataArray count]];
    
    return lblCounter;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];

        UILabel *label1 = [self newLabelWithFrame:CGRectMake(20, 12, 110, 20) 
                                          textColor:[UIColor whiteColor] 
                                               font:[UIFont boldSystemFontOfSize:26] 
                                      textAlignment:UITextAlignmentLeft 
                                                tag:kTicketNumberTag];
        [cell.contentView addSubview:label1];

        UILabel *label2 = [self newLabelWithFrame:CGRectMake(180, 12, 110, 20)
                                      textColor:[UIColor colorWithRed:59.0/255 green:186.0/255 blue:251.0/255 alpha:1.0] 
                                           font:[UIFont boldSystemFontOfSize:14] 
                                  textAlignment:UITextAlignmentRight
                                            tag:kPriorityTag];
        [cell.contentView addSubview:label2];
        
        UILabel *label3 = [self newLabelWithFrame:CGRectMake(20, 38, 150, 20) 
                                        textColor:[UIColor whiteColor] 
                                             font:[UIFont systemFontOfSize:13] 
                                    textAlignment:UITextAlignmentLeft 
                                              tag:kAssignmentGPTag];
        [cell.contentView addSubview:label3];
        
        UILabel *label4 = [self newLabelWithFrame:CGRectMake(180, 38, 110, 20) 
                                      textColor:[UIColor whiteColor] 
                                           font:[UIFont systemFontOfSize:13] 
                                  textAlignment:UITextAlignmentRight 
                                            tag:kAssigneeTag];
        [cell.contentView addSubview:label4];
        
        UILabel *label5 = [self newLabelWithFrame:CGRectMake(20, 64, 110, 20) 
                                    textColor:[UIColor colorWithRed:59.0/255 green:186.0/255 blue:251.0/255 alpha:1.0] 
                                         font:[UIFont systemFontOfSize:13] 
                                textAlignment:UITextAlignmentLeft 
                                          tag:kStatusTag];
        [cell.contentView addSubview:label5];
        
        UILabel *label6 = [self newLabelWithFrame:CGRectMake(20, 90, 280, 20) 
                                         textColor:[UIColor whiteColor] 
                                              font:[UIFont systemFontOfSize:13] 
                                     textAlignment:UITextAlignmentLeft 
                                               tag:kDescriptionTag];
        [cell.contentView addSubview:label6];
    }
    ticketNumberLabel = (UILabel *)[cell.contentView viewWithTag:kTicketNumberTag];
    priorityLabel = (UILabel *)[cell.contentView viewWithTag:kPriorityTag];
    assignmentLabel = (UILabel *)[cell.contentView viewWithTag:kAssignmentGPTag];
    assigneeLabel = (UILabel *)[cell.contentView viewWithTag:kAssigneeTag];
    statusLabel = (UILabel *)[cell.contentView viewWithTag:kStatusTag];
    descriptionLabel = (UILabel *)[cell.contentView viewWithTag:kDescriptionTag];
    
    NSDictionary *dict = [dataArray objectAtIndex:indexPath.row];
    
    ticketNumberLabel.text = [dict objectForKey:kTicketNumberKey];
    priorityLabel.text = [dict objectForKey:kPriorityKey];
    assignmentLabel.text = [dict objectForKey:kAssignmentGPKey];
    assigneeLabel.text = [dict objectForKey:kAssigneeKey];
    statusLabel.text = [dict objectForKey:kStatusKey];
    descriptionLabel.text = [dict objectForKey:kDescriptionKey];
    
    cell.accessoryView = TableCell_AccessoryArrow;    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];

    IncidentDetailViewController *childController = [[IncidentDetailViewController alloc] 
                                                     initWithNibName:@"IncidentDetailViewController" 
                                                     bundle:nil];
    childController.tableDataSource = [dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:childController animated:YES];
    [childController release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 122.0f;
}

@end
