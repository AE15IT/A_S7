//
//  ActionApproveViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ActionApproveViewController.h"
#import "Constants.h"
#import "ChangeDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CommonFuns.h"

@implementation ActionApproveViewController

@synthesize txtDescView;
@synthesize lblTicketNum;
@synthesize ticket;
@synthesize btnApprove;

- (void)ApproveButtonPressed{
    
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
    [txtDescView release];
    [lblTicketNum release];
    [btnApprove release];
    [ticket release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = TableView_BackgroundColor;
    self.title = [NSString stringWithFormat:@"Approve : %@", ticket.num];
    
    self.lblTicketNum.text = ticket.num;
    
    [txtDescView.layer setCornerRadius:8.0f];
    txtDescView.clipsToBounds = YES;
    self.txtDescView.text = ticket.desc;
    
    
    btnApprove= [CommonFuns newActionButtonWithTitle:@"Approve" frame:CGRectMake(40, 260, 240, 37)];
    [btnApprove addTarget:self action:@selector(ApproveButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [btnApprove.layer setCornerRadius:10.0f];
    btnApprove.clipsToBounds = YES;
    [self.view addSubview:btnApprove];
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
