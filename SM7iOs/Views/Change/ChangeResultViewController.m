//
//  ChangeResultViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ChangeResultViewController.h"
#import "ChangeDetailViewController.h"
#import "ChangesResultCell.h"
#import "CommonFuns.h"
#import "Constants.h"


@implementation ChangeResultViewController

@synthesize dataSource;

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    
    if (self) {
        self.title = @"Change Results";
        
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        self.tableView.backgroundColor = TableView_BackgroundColor;
        self.tableView.separatorColor = TableView_SeparatorColor;
        
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"Back";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
    }
    
    return self;
}

- (void)dealloc{
    [dataSource release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //self.tableView.tableHeaderView = [CommonFuns createLabel4HeaderWithCount:[dataSource count]];
}


- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{    
    static NSString *CellIdentifier = @"Change Results";
    
    ChangesResultCell *cell = (ChangesResultCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ChangesResultCell" owner:self options:nil] lastObject];
    }
    
    Ticket *ticket = (Ticket *)[dataSource objectAtIndex:indexPath.row];
    [cell setCellContentWithTicket:ticket];
    
    cell.accessoryView = TableCell_AccessoryArrow;
    
    return cell;
}

#pragma mark - Table view delegate

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
    
    lblCounter.text = [NSString stringWithFormat:@"Total : %d", [dataSource count]];
    
    return lblCounter;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ChangeDetailViewController *detail = [[ChangeDetailViewController alloc] init];
    detail.ticket = (Ticket *)[dataSource objectAtIndex:indexPath.row];
    detail.title = [NSString stringWithFormat:@"%@ Detail", detail.ticket.num];
    
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
}
 

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140.0;
}


@end
