//
//  SelectListViewController.m
//  SM7iOs
//
//  Created by Black on 11-9-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SelectListViewController.h"


@implementation SelectListViewController

@synthesize delegate = _delegate;
@synthesize dataSource;
@synthesize field;
@synthesize atLeastOne;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (atLeastOne == YES)
        return [dataSource count];
    else
        return [dataSource count] + 1; //---Row 0 set to "Please Select"---
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    if (atLeastOne == YES)
        cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
    else
    {
        if (indexPath.row == 0)
            cell.textLabel.text = @"None";
        else
            cell.textLabel.text = [dataSource objectAtIndex:(indexPath.row - 1)];
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedValue = nil;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (atLeastOne == YES)
    {
        selectedValue = cell.textLabel.text;
        [self dismissModalViewControllerAnimated:YES];
    }
    else
    {
        if (indexPath.row == 0)
            selectedValue = @"Please Select";
        else
            selectedValue = cell.textLabel.text;
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self.delegate selectFinishedWithValue:selectedValue forField:field];
}

@end
