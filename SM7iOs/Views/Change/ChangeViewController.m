//
//  ChangeViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ChangeViewController.h"
#import "ChangeResultViewController.h"
#import "SM7iOsAppDelegate.h"
#import "CommonFuns.h"
#import "Constants.h"
#import "Ticket.h"
#import "Combobox.h"


@interface ChangeViewController (ChangePrivate)

- (void)searchTicket;
- (void)selectButtonClicked:(id)sender event:(id)event;
- (void)popupSingleSelction;

@end

@implementation ChangeViewController

@synthesize txtTicket;
@synthesize txtCategery;
@synthesize txtPhase;
@synthesize searchConditions;


#pragma mark - Private methods

// TODO: Get ticket num and selections here and set data source to next result view.
- (void)logout{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure want to logout?" 
                                                             delegate:self 
                                                    cancelButtonTitle:@"Cancel" 
                                               destructiveButtonTitle:@"Logout" 
                                                    otherButtonTitles:nil];
    [actionSheet showInView:self.view.superview];
    [actionSheet release];
}

- (void)searchTicket{    
    //
    ChangeResultViewController *ctrlResult = [[ChangeResultViewController alloc] initWithStyle:UITableViewStylePlain];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 50; i++) {
        Ticket *ticket = [[Ticket alloc] init];
        ticket.num = [NSString stringWithFormat:@"C100%d", i];
        ticket.category = [NSString stringWithFormat:@"Hardware"];
        ticket.phase = [NSString stringWithFormat:@"Change Approval"];
        ticket.priorty = [NSString stringWithFormat:@"2 - High"];
        ticket.cc = [NSString stringWithFormat:@"Change.Approver"];
        ticket.status = [NSString stringWithFormat:@"Pending"];
        ticket.group = [NSString stringWithFormat:@"Application"];
        ticket.title = [NSString stringWithFormat:@"testllllllllllllllllllllllllllllllllttttttttttttttllllllllllllllllllllllltslllllllllllllllllllllllllllllllllllllllllllllllllllllllts"];
        ticket.desc = [NSString stringWithFormat:@"Virus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.testVirus scan report Multiple Virusse.test if it can displllllllllay"];
        
        [arr addObject:ticket];
        [ticket release];
    }
    
    ctrlResult.dataSource = [NSArray arrayWithArray:arr];
    [arr release];
    
    [self.navigationController pushViewController:ctrlResult animated:YES];
    [ctrlResult release];
}

// TODO: not impletment yet.
- (void)popupSingleSelction{
    //Here for action to open multiple selections.
}

- (UITextField *)initCellTextField
{
    UITextField *textField = [[UITextField alloc] init];
    
    textField.frame = CGRectMake(150, 6, 150, 30);
    textField.borderStyle = UITextBorderStyleNone;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.enablesReturnKeyAutomatically = NO;
    textField.returnKeyType = UIReturnKeySearch;
    textField.font = [UIFont systemFontOfSize:14];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    textField.placeholder = @"Touch to input...";
    [textField setValue:Label_BlueColor forKeyPath:@"_placeholderLabel.textColor"];  
    textField.textColor = Label_BlueColor;
   
    textField.delegate = self;
    
    return textField;
}

#pragma mark - View controller methods

- (void)awakeFromNib{
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.tableView.backgroundColor = TableView_BackgroundColor;
    self.tableView.separatorColor = TableView_SeparatorColor;
    
    self.tableView.scrollEnabled = NO;
}

- (void)dealloc{
    [searchConditions release];
    [txtCategery release];
    [txtTicket release];
    [txtPhase release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// TODO: get the count of changes here.
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Change Management";
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)] autorelease];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
    //myChanges = ?
    //groupChanges = ?
    //---pseudo data---
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableArray *groups = [[NSMutableArray alloc] initWithObjects:@"Appliction",@"Hardware",@"Network", nil];
    NSMutableArray *coordinators = [[NSMutableArray alloc] initWithObjects:@"Change.Coordinator",@"Reachel.Boudreal",@"falcon", nil];
    NSMutableArray *approvalStatus = [[NSMutableArray alloc] initWithObjects:@"Pending", @"Approved", @"Denied", nil];
    
    [array addObject:groups];
    [array addObject:coordinators];
    [array addObject:approvalStatus];
    [groups release];
    [coordinators release];
    [approvalStatus release];
    
    searchConditions = array;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ChangesSearch";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
        
        switch (indexPath.row) {
            case ChangeSearchRowIndexSearch:
                txtTicket = [CommonFuns newTxtSearchWithTarget:self action:@selector(searchTicket)];
                [cell.contentView addSubview:txtTicket];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
                
            case ChangeSearchRowIndexCategory:
            {

                UILabel *lblCatogory = [CommonFuns createLabelInCell:@"Category:"];
                [cell.contentView addSubview:lblCatogory];         
                 
                txtCategery = [self initCellTextField];
                [cell.contentView addSubview:txtCategery];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            
            case ChangeSearchRowIndexPhase:
            {
                UILabel *lblPhase = [CommonFuns createLabelInCell:@"Phase:"];
                [cell.contentView addSubview:lblPhase];
                
                txtPhase = [self initCellTextField];
                [cell.contentView addSubview:txtPhase];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            }   
            case ChangeSearchRowIndexGroup:
            {
                UILabel *lblGroup = [CommonFuns createLabelInCell:@"Group:"];
                [cell.contentView addSubview:lblGroup];
                
                groupCombobox = [[Combobox alloc] initComboboxWithFrame:CGRectMake(150, 2, 170, 40) 
                                                             dataSource:[searchConditions objectAtIndex:0]];
                
                [cell.contentView addSubview:groupCombobox];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
          }    
  
            case ChangeSearchRowIndexCoordinator:
            {   
                UILabel *lblCoordinator = [CommonFuns createLabelInCell:@"Coordinator:"];
                [cell.contentView addSubview:lblCoordinator];

                coordinatorCombobox = [[Combobox alloc] initComboboxWithFrame:CGRectMake(150, 2, 170, 40) 
                                                             dataSource:[searchConditions objectAtIndex:1]];
                
                [cell.contentView addSubview:coordinatorCombobox];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            }  
            case ChangeSearchRowIndexApprovalStatus:
            {   
                UILabel *lblApprovalStatus = [CommonFuns createLabelInCell:@"Approval Status:"];
                [cell.contentView addSubview:lblApprovalStatus];
                approvalStatusCombobox = [[Combobox alloc] initComboboxWithFrame:CGRectMake(150, 2, 170, 40) 
                                                             dataSource:[searchConditions objectAtIndex:2]];
                
                [cell.contentView addSubview:approvalStatusCombobox];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
            }   
            case ChangeSearchRowIndexMyChanges:
                cell.textLabel.text = @"My Changes";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"(%d)", myChanges];
                cell.accessoryView = TableCell_AccessoryArrow;
                break;
                
            case ChangeSearchRowIndexGroupChanges:
                cell.textLabel.text = @"My Group's Changes ";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"(%d)", groupChanges];
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
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        [txtTicket resignFirstResponder];
        [txtCategery resignFirstResponder];
        [txtPhase resignFirstResponder];


    if (indexPath.row == ChangeSearchRowIndexMyChanges || indexPath.row == ChangeSearchRowIndexGroupChanges) {
        [self searchTicket];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == ChangeSearchRowIndexSearch) {
        return 56.0;
    }else{
        return 42.0;
    }
}

// TODO: impletment each row funciton here.
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case ChangeSearchRowIndexGroup:
            break;
            
        case ChangeSearchRowIndexCoordinator:
            break;
            
        case ChangeSearchRowIndexApprovalStatus:
            break;
            
        case ChangeSearchRowIndexMyChanges:
            break;
            
        case ChangeSearchRowIndexGroupChanges:
            break;
            
        default:
            break;
    }
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self searchTicket];
    
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
