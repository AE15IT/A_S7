//
//  SettingViewController.m
//  SM7iOs
//
//  Created by Black on 11-7-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SettingViewController.h"
#import "SM7iOsAppDelegate.h"
#import "LoginUserData.h"
#import "Constants.h"
#import "SelectListViewController.h"

@implementation SettingViewController

@synthesize txtServerAddress;
@synthesize swhAutoUpdate;
@synthesize useAnimation;

#pragma mark - Save & Get setting data

- (void)saveSettingData
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:(txtServerAddress.text ? txtServerAddress.text : @"") forKey:kServerAddressKey];
    [dict writeToFile:[LoginUserData dataFilePath:kSettingData] atomically:YES];
    [dict release];
}

- (void)getSettingData
{
    //---get from plist file---
    NSString *filePath = [LoginUserData dataFilePath:kSettingData];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) 
    {
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
        txtServerAddress.text = [dict objectForKey:kServerAddressKey];
        [dict release];
    }
}

- (void)testServerAddress
{
//TODO: Do some useful thing instead of sleep
    sleep(2);
    
    //---show success hud if test successfully complete---
	// The sample image is based on the work by www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
	// Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
	HUD.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
	HUD.mode = MBProgressHUDModeCustomView;
	HUD.labelText = @"Success";
	sleep(1);
}

#pragma mark - Actions

- (void)dismissSetting
{
    [txtServerAddress resignFirstResponder];
    
    if (useAnimation == YES)//---From Login view---
    {
        [self dismissModalViewControllerAnimated:YES];
    }
    else 
    { 
        SM7iOsAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        [appDelegate logOut];
    }
}

- (IBAction)done:(id)sender
{
    [self saveSettingData];
    [self dismissSetting];
}

- (IBAction)cancel:(id)sender
{
    [self dismissSetting];
}

- (void)swhAutoUpdateAction:(id)sender
{
    NSLog(@"sender :%d", [sender isOn]);
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self getSettingData];
    
    //---Sometimes causes 'wait_fences: failed to receive reply: 10004003' error---
//    if ([txtServerAddress.text length] == 0)
//        [txtServerAddress becomeFirstResponder];
   
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.txtServerAddress = nil;
    self.swhAutoUpdate = nil;
//    self.swhSaveID = nil;
    [super viewDidUnload];
}

- (void)dealloc
{
    [txtServerAddress release];
    [super dealloc];
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

#pragma mark - Text Field Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if ([txtServerAddress.text length] > 0)
    {
        //---test server address and show the HUD---
        HUD = [[MBProgressHUD alloc] initWithView:self.view.window];
        [self.view.window addSubview:HUD];
        HUD.delegate = self;
        HUD.dimBackground = YES;
        HUD.labelText = @"Testing...";
        [HUD showWhileExecuting:@selector(testServerAddress) onTarget:self withObject:nil animated:YES];
    }
    
    return YES;
}

#pragma mark - Table Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = nil;
    
    if (section == 0)
        title = @"Service Url";
    else
        title = @"Others";
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    static NSString *CellID = @"CellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellID] autorelease];
    }
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    switch (section) {
        case 0://---Service Url---
            if (row == 0) 
            {
                txtServerAddress = [[UITextField alloc] initWithFrame:CGRectMake(10, 2, 280, 40)];
                txtServerAddress.borderStyle = UITextBorderStyleNone;
                txtServerAddress.backgroundColor = [UIColor clearColor];
                txtServerAddress.font = [UIFont systemFontOfSize:16.0f];
                txtServerAddress.placeholder = @"Please set before login";
                txtServerAddress.keyboardType = UIKeyboardTypeURL;
                txtServerAddress.returnKeyType = UIReturnKeyDone;
                txtServerAddress.autocapitalizationType = UITextAutocapitalizationTypeNone;
                txtServerAddress.autocorrectionType = UITextAutocorrectionTypeNo;
                txtServerAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
                txtServerAddress.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
                txtServerAddress.delegate = self;
                [cell.contentView addSubview:txtServerAddress];      
                [txtServerAddress release];
            }
            else if (row == 1)
            {
                cell.textLabel.textColor = [UIColor grayColor];
                cell.textLabel.font = [UIFont systemFontOfSize:12];
                cell.textLabel.text = @"Contact Service Manager Administrator.";
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        case 1://---Others---
            if (row == 0) 
            {
                cell.textLabel.text = @"Auto Check Update";
                swhAutoUpdate = [[UISwitch alloc] initWithFrame:CGRectZero];
                [swhAutoUpdate addTarget:self action:@selector(swhAutoUpdateAction:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView = swhAutoUpdate;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            else if (row == 1)
            {
                cell.textLabel.text = @"Display";
                cell.detailTextLabel.text = @"20 records on each page";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            break; 
        default:
            break;
    }  
    return cell;
}

#pragma mark Table Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    CGFloat height;
    
    if (section == 0 && row == 1)
            height = 22.0f;
    else 
        height = 44.0f;
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 1) {
//TODO: Select 
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - MBProgressHUDDelegate Methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    [HUD release];
	HUD = nil;
}

@end
