//
//  ActionDenyViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ActionDenyViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "CommonFuns.h"


@implementation ActionDenyViewController

@synthesize lblTicketNum;
@synthesize txtDenyReasonView;
@synthesize ticket;
@synthesize btnDeny;

- (void)denyButtonPressed{
    
}

- (IBAction)backgroundTapped
{
    [self.txtDenyReasonView resignFirstResponder];
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
    [btnDeny release];
    [lblTicketNum release];
    [txtDenyReasonView release];
    [ticket release];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.view.backgroundColor = TableView_BackgroundColor;
    self.title = [NSString stringWithFormat:@"Deny : %@", ticket.num];
    self.lblTicketNum.text = ticket.num;
    
    [txtDenyReasonView.layer setCornerRadius:8.0f];
    txtDenyReasonView.clipsToBounds = YES;
    self.txtDenyReasonView.text = ticket.denyReason;
    
    btnDeny= [CommonFuns newActionButtonWithTitle:@"Deny" frame:CGRectMake(40, 260, 240, 37)];
    [btnDeny addTarget:self action:@selector(denyButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [btnDeny.layer setCornerRadius:10.0f];
    btnDeny.clipsToBounds = YES;
    [self.view addSubview:btnDeny];

}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
