//
//  ChangeDetailViewController.m
//  SM7iOs
//
//  Created by eleven li on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChangeDetailViewController.h"
#import "TicketDetailCell.h"
#import "ActionApproveViewController.h"
#import "ActionDenyViewController.h"
#import "CommonFuns.h"
#import "Constants.h"

@implementation ChangeDetailViewController

@synthesize ticket;
@synthesize btnApprove;
@synthesize btnDeny;

#pragma mark - Custom methods.

- (void)approveButtonClicked{
    ActionApproveViewController *ctrlApprove = [[ActionApproveViewController alloc] initWithNibName:@"ActionApproveViewController" bundle:nil];
    ctrlApprove.ticket = self.ticket;
    
    [self.navigationController pushViewController:ctrlApprove animated:YES];
    [ctrlApprove release];
}

- (void)denyButtonClicked{
    ActionDenyViewController* ctrlDeny = [[ActionDenyViewController alloc] initWithNibName:@"ActionDenyViewController" bundle:nil];
    ctrlDeny.ticket = self.ticket;
    [self.navigationController pushViewController:ctrlDeny animated:YES];
    [ctrlDeny release];
}

#pragma mark - View methods.

- (id)init{
    self = [super init];
    
    if (self) {
        self.title = @"Search Result";
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        self.view.backgroundColor = TableView_BackgroundColor;
        
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"Back";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
    }
    
    return self;
}

- (void)dealloc{
    [ticket release];
    [btnDeny release];
    [btnApprove release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)loadView{
    [super loadView];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 330.0) style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    [table release];
    
    btnApprove = [CommonFuns newActionButtonWithTitle:@"Approve" frame:CGRectMake(50.0, 330.0, 100.0, 37.0)];
    [btnApprove addTarget:self action:@selector(approveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnApprove];
    
    btnDeny = [CommonFuns newActionButtonWithTitle:@"Deny" frame:CGRectMake(170.0, 330.0, 110.0, 37.0)];
    [btnDeny addTarget:self action:@selector(denyButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDeny];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Table view data source methods.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    const unsigned int TicketCell_Space = 12;
    
    static NSString *CellIdentifier = @"ChangeDetail";
    
    TicketDetailCell *cell = (TicketDetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TicketDetailCell" owner:self options:nil] lastObject];
    }
    
    // Configure the cell...
    switch (indexPath.row) {
        case ChangeDetailRowIndexNumber:
            [cell setCellContentWithKey:@"Ticket #:" value:ticket.num];
            break;
            
        case ChangeDetailRowIndexPriority:
            [cell setCellContentWithKey:@"Priority:" value:ticket.priorty];
            break;
            
        case ChangeDetailRowIndexCategory:
            [cell setCellContentWithKey:@"Category:" value:ticket.category];
            break;
            
        case ChangeDetailRowIndexPhase:
            [cell setCellContentWithKey:@"Phase:" value:ticket.phase];
            break;
            
        case ChangeDetailRowIndexGroup:
            [cell setCellContentWithKey:@"Assignment GP:" value:ticket.group];
            break;
            
        case ChangeDetailRowIndexCoordinator:
            [cell setCellContentWithKey:@"Coordinator:" value:ticket.cc];
            break;  
        
        case ChangeDetailRowIndexApprovalStatus:
            [cell setCellContentWithKey:@"Status:" value:ticket.status];
            break;   
            
        case ChangeDetailRowIndexTitle:
            [cell setCellContentWithKey:@"Title:" value:ticket.title];
            break;
            
        case ChangeDetailRowIndexDescription:
            [cell setCellContentWithKey:@"Description:" value:ticket.desc];
            break;
            
       
        default:
            break;
    }
    
    CGSize size = CGSizeMake(256, MAXFLOAT);
    CGSize lblSize = [cell.lblValue.text sizeWithFont:cell.lblValue.font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    cell.lblValue.frame = CGRectMake(cell.lblValue.frame.origin.x, cell.lblValue.frame.origin.y, cell.lblValue.frame.size.width, lblSize.height);
    cellHeight = cell.lblValue.frame.size.height > 20.0 ? cell.lblValue.frame.size.height + cell.lblKey.frame.size.height + TicketCell_Space : 49.0;
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    tableView.separatorColor = TableView_SeparatorColor;
    tableView.backgroundColor = TableView_BackgroundColor;
    
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return cell;
}

#pragma mark - Table view delegate methods.

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cellHeight;
}

@end
