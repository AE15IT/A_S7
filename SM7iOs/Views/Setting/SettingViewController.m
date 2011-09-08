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

@implementation SettingViewController

@synthesize txtServerAddress;
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

#pragma mark - IBActions

- (IBAction)done:(id)sender
{
    [txtServerAddress resignFirstResponder];
    [self saveSettingData];
    
    if (useAnimation == YES)
    {
        [self dismissModalViewControllerAnimated:YES];
    }
    else 
    { 
        SM7iOsAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        [appDelegate logOut];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UITextField *aTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 7, 280, 30)];
    aTextField.borderStyle = UITextBorderStyleNone;
    aTextField.backgroundColor = [UIColor clearColor];
    aTextField.placeholder = @"Please set before login";
    aTextField.keyboardType = UIKeyboardTypeURL;
    aTextField.returnKeyType = UIReturnKeyDone;
    aTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    aTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    aTextField.delegate = self;
    self.txtServerAddress = aTextField;
    [aTextField release];
    
    [self getSettingData];
    
    //---Sometimes causes 'wait_fences: failed to receive reply: 10004003' error---
//    if ([txtServerAddress.text length] == 0)
//        [txtServerAddress becomeFirstResponder];
   
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.txtServerAddress = nil;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Server Address";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0)
    {
        static NSString *TextCellID = @"TextCellID";
        cell = [tableView dequeueReusableCellWithIdentifier:TextCellID];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TextCellID] autorelease];
            
            [cell.contentView addSubview:txtServerAddress];      
            [txtServerAddress release];
        }   
    }
    else
    {
        static NSString *LabelCellID = @"LabelCellID";
        cell = [tableView dequeueReusableCellWithIdentifier:LabelCellID];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LabelCellID] autorelease];
            
            cell.textLabel.textColor = [UIColor grayColor];
            cell.textLabel.font = [UIFont systemFontOfSize:12];
            cell.textLabel.text = @"e.g. http://yourcompany.com/sm7";
        }         
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark Table Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row == 0) ? 44.0f : 22.0f; 
}

#pragma mark - MBProgressHUDDelegate Methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    [HUD release];
	HUD = nil;
}

@end
