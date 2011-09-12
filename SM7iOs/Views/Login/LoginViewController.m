//
//  LoginViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "SM7iOsAppDelegate.h"
#import "LoginCheckBox.h"
#import "LoginUserData.h"
#import "SettingViewController.h"

#import "SBJson.h"

#define kUserNameKey    @"username"
#define kPasswordKey    @"password"

@implementation LoginViewController

@synthesize txtUserName;
@synthesize txtPassword;
@synthesize btnLogin;
@synthesize btnSetting;
@synthesize shouldSave;
@synthesize checkBox;

#pragma mark - Communicate with server

- (void)connectServerThenLogin 
{
//TODO: Do some useful thing instead of sleep
    sleep(1);
    SM7iOsAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate logOn];
}


- (void)saveLoginData
{    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:(txtUserName.text ? txtUserName.text : @"") forKey:kUserNameKey];
    [dict setObject:(txtPassword.text ? txtPassword.text : @"") forKey:kPasswordKey];
    [dict setObject:(checkBox.isChecked ? @"shouldSave" : @"shouldNotSave") forKey:kCheckBoxKey];
    [dict writeToFile:[LoginUserData dataFilePath:kLoginData] atomically:YES];
    [dict release];
}

- (void)getLoginData
{
    //---get from plist file---
    NSString *filePath = [LoginUserData dataFilePath:kLoginData];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) 
    {
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
        
        txtUserName.text = [dict objectForKey:kUserNameKey];
        
        shouldSave = [NSMutableString stringWithString:[dict objectForKey:kCheckBoxKey]];
        
        if ([shouldSave isEqualToString:@"shouldSave"])
        {
            txtPassword.text = [dict objectForKey:kPasswordKey];
        }
        else
        {
            txtUserName.text = nil;
            txtPassword.text = nil;
        }
        [dict release];
    }
}

#pragma mark - Keyboard Management

- (void)keyboardWillShown:(NSNotification *)notification
{
    [UIView beginAnimations:@"MoveUp" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    UIViewAnimationTransition transition = UIViewAnimationTransitionNone;
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    
    self.view.frame = CGRectMake(0, -196, 320, 460);
    
    [UIView commitAnimations];
}

- (void)keyboardWillHidden:(NSNotification *)notification
{
    [UIView beginAnimations:@"MoveDown" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    UIViewAnimationTransition transition = UIViewAnimationTransitionNone;
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    
    self.view.frame = CGRectMake(0, 20, 320, 460);
    
    [UIView commitAnimations];
}

#pragma mark - IBActions

- (IBAction)login{
    [txtUserName resignFirstResponder];
    [txtPassword resignFirstResponder];
    
    //---Save user login information---
    [self saveLoginData];
    
    //---Show the HUD---
    HUD = [[MBProgressHUD alloc] initWithView:self.view.window];
    [self.view.window addSubview:HUD];
    HUD.delegate = self;
    HUD.dimBackground = YES;
    HUD.labelText = @"Logining";
    [HUD showWhileExecuting:@selector(connectServerThenLogin) onTarget:self withObject:nil animated:YES];
}

- (IBAction)setting
{
    SettingViewController *settingViewController = [[SettingViewController alloc] init];
    [self.view addSubview:settingViewController.view];
    settingViewController.useAnimation = YES;
    [self presentModalViewController:settingViewController animated:YES];
    
}

- (IBAction)backgroundTapped
{
    [txtUserName resignFirstResponder];
    [txtPassword resignFirstResponder];
}

#pragma mark - Initialize custom views

- (void)initCheckBox    
{
    LoginCheckBox *aCheckBox = [[LoginCheckBox alloc] initWithFrame:CGRectMake(25, 320, 200, 40)];
    
    if ([shouldSave isEqualToString:@"shouldSave"] == YES)
    {
        aCheckBox.isChecked = YES; //---check---
        [aCheckBox setImage:[UIImage imageNamed:@"btn_checked.png"] forState:UIControlStateNormal];
    }
    checkBox = aCheckBox;
    [self.view addSubview:checkBox];
    [checkBox release];
}

- (UITextField *)initTextFieldWithFrame: (CGRect)aFrame 
                            placeholder: (NSString *)placeholder 
                          returnKeyType: (UIReturnKeyType)returnKeyType 
                        secureTextEntry: (BOOL)secureTextEntry
{
    UITextField *aTextField = [[UITextField alloc] initWithFrame:aFrame];
    aTextField.placeholder = placeholder;
    aTextField.returnKeyType = returnKeyType;
    aTextField.secureTextEntry = secureTextEntry;
    aTextField.borderStyle = UITextBorderStyleRoundedRect;
    aTextField.font = [UIFont systemFontOfSize:16];
    aTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    aTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    aTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    aTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    aTextField.delegate = self;
    
    return aTextField;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1.0];
 
    txtUserName = [self initTextFieldWithFrame:CGRectMake(25, 230, 270, 38) 
                                   placeholder:@"User name" 
                                 returnKeyType:UIReturnKeyNext 
                               secureTextEntry:NO];
    [self.view addSubview:txtUserName];
    [txtUserName release];

    txtPassword = [self initTextFieldWithFrame:CGRectMake(25, 280, 270, 38) 
                                   placeholder:@"Password" 
                                 returnKeyType:UIReturnKeyDone 
                               secureTextEntry:YES];
    [self.view addSubview:txtPassword];
    [txtPassword release];
    
    [self getLoginData];

    [self initCheckBox];
    
    //---Register for keyboard notification---
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillShown:) 
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(keyboardWillHidden:) 
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    self.txtUserName = nil;
    self.txtPassword = nil;
    self.btnLogin = nil;
    self.btnSetting = nil;
    self.checkBox = nil;
    [super viewDidUnload];
}

- (void)dealloc
{
    [txtUserName release];
    [txtPassword release];
    [btnLogin release];
    [btnSetting release];
    [shouldSave release];
    [checkBox release];
    [super dealloc];
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

#pragma mark -
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    [HUD release];
	HUD = nil;
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //---Make 'Next' return key work---
    if (textField == txtUserName)
        [txtPassword becomeFirstResponder];
    else
        [textField resignFirstResponder];
	return YES;
}

@end
