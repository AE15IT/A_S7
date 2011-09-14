//
//  ActionUpdateViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ActionUpdateViewController.h"
#import "IncidentDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CommonFuns.h"
#import "Constants.h"


@implementation ActionUpdateViewController


@synthesize dataSource;

- (void)updateButtonPressed
{
    
}

- (IBAction)backgroundTapped
{
    [journalUpdate resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [ticketNumberLabel release];
    [journalUpdate release];
    [dataSource release];
    [btnUpdate release];
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
    self.navigationItem.title = @"Update Incident";
    
    ticketNumberLabel.text = [dataSource objectForKey:kTicketNumberKey];
    
    btnUpdate = [CommonFuns newActionButtonWithTitle:@"Save" frame:CGRectMake(40, 260, 240, 37)];
    [btnUpdate addTarget:self action:@selector(updateButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [btnUpdate.layer setCornerRadius:10.0f];
    btnUpdate.clipsToBounds = YES;
    [self.view addSubview:btnUpdate];
    
    [journalUpdate.layer setCornerRadius:8.0f];
    [journalUpdate.layer setBorderWidth:1.0f];
    [journalUpdate.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [journalUpdate.layer setCornerRadius:8.0f];
    journalUpdate.clipsToBounds = YES;
    journalUpdate.text = [dataSource objectForKey:kJournalUpdateKey];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
