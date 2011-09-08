//
//  ActionResolveViewController.m
//  SM7iOs
//
//  Created by Envy.Chen on 11-7-25.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ActionResolveViewController.h"
#import "IncidentDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CommonFuns.h"
#import "Combobox.h"
#import "Constants.h"


@implementation ActionResolveViewController


@synthesize dataSource;

- (void)resolveButtonPressed
{
    
}

- (IBAction)backgroundTapped
{
    closureComment.frame = CGRectMake(20, 141, 280, 145);
    [closureComment resignFirstResponder];
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
    [closureComment release];
    [dataSource release];
    [btnResolve release];
    [closureCodeCombobox release];
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
    self.view.backgroundColor = TableView_BackgroundColor;
    
    NSString *title = [NSString stringWithFormat:@"Resolve : %@", [dataSource objectForKey:kTicketNumberKey]];
    self.navigationItem.title = title;

    ticketNumberLabel.text = [dataSource objectForKey:kTicketNumberKey];
    
    btnResolve = [CommonFuns newActionButtonWithTitle:@"Resolve" frame:CGRectMake(40, 308, 240, 37)];
    [btnResolve addTarget:self action:@selector(resolveButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [btnResolve.layer setCornerRadius:10.0f];
    btnResolve.clipsToBounds = YES;
    [self.view addSubview:btnResolve];
    
    //---Pesudo closure codes---
    NSMutableArray *closureCodes = [NSMutableArray array];
    for (int i = 0; i < 50; i ++) {
        NSString *code = [NSString stringWithFormat:@"Closure Code %d",i];
        [closureCodes addObject:code];
    }   
    
    closureCodeCombobox = [[Combobox alloc] initComboboxWithFrame:CGRectMake(40, 80, 260, 30) 
                                                       dataSource:closureCodes];
    closureCodeCombobox.comboLabel.text = [dataSource objectForKey:kClosureCodeKey];
    [self.view addSubview:closureCodeCombobox];
  
    [closureComment.layer setCornerRadius:8.0f];
    closureComment.clipsToBounds = YES;
    closureComment.text = [dataSource objectForKey:kClosureCommentsKey];
    

    
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

#pragma mark - TextView Delegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    closureComment.frame = CGRectMake(20, 141, 280, 48);
}

@end
