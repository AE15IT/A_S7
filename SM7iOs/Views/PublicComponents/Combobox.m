//
//  Combobox.m
//  SM7iOs
//
//  Created by Black on 11-9-5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Combobox.h"
#import "CommonFuns.h"
#import "Constants.h"


@implementation Combobox


@synthesize comboLabel;

#pragma mark - Custom Views

//---Initialize a custom UIActionSheet with a UIToolbar and a UIPickerView---
- (UIActionSheet *)newCustomActionSheet
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:nil
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    actionSheet.backgroundColor = [UIColor clearColor];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
	[toolBar sizeToFit];
    
    //---use an array to load the buttons in toolbar---
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
	
	UIBarButtonItem *btnCancel = [[UIBarButtonItem alloc] 
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                  target:self
                                  action:@selector(cancelButtonPressed)];
	[barItems addObject:btnCancel];
	[btnCancel release];
    
    UIBarButtonItem *btnFlexibleSpace = [[UIBarButtonItem alloc] 
                                         initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                         target:self 
                                         action:nil];
	[barItems addObject:btnFlexibleSpace];
	[btnFlexibleSpace release];
	
	UIBarButtonItem *btnDone = [[UIBarButtonItem alloc] 
								initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                target:self
                                action:@selector(doneButtonPressed)];
	[barItems addObject:btnDone];
	[btnDone release];
    
    //---put those buttons into toolbar---
	[toolBar setItems:barItems animated:YES];
	[barItems release];
    
    [actionSheet addSubview: toolBar];
    [toolBar release];
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    picker.showsSelectionIndicator = YES;
    picker.delegate = self;
    picker.dataSource = self;
    [actionSheet addSubview:picker];
    [picker release];
    
    return actionSheet;
}

- (UILabel *)newComboLabelWithFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.backgroundColor = [UIColor clearColor];
//    label.textColor = Label_BlueColor;
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"Please Select";
    
    return label;
}

//- (UIButton *)newComboButtonWithPoint:(CGPoint)point
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//
//    
//    
////    //---The image's size is 26 * 26 pixels---
////    UIImage *image = [UIImage imageNamed:@"btn_select.png"];
////    button.frame = CGRectMake(point.x, point.y, image.size.width, image.size.height);
////    [button setBackgroundImage:image forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(selectButtonTapped) 
//     forControlEvents:UIControlEventTouchUpInside];
//    
//    return button;
//}


#pragma mark - Actions

- (void)doneButtonPressed
{   
    if ([selectedValue length] == 0)
        comboLabel.text = @"Please Select";
    else
        comboLabel.text = selectedValue;
    
    [customActionSheet dismissWithClickedButtonIndex:1 animated:YES];
}

- (void)cancelButtonPressed
{
    [customActionSheet dismissWithClickedButtonIndex:1 animated:YES];
}

- (void)selectButtonTapped
{
    [customActionSheet showInView:self.window];
    [customActionSheet setBounds:CGRectMake(0, 0, 320, 500)];
}

#pragma mark -

- (id)initComboboxWithFrame:(CGRect)frame dataSource:(NSArray *)data
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        
        dataArray = [[NSArray alloc] initWithArray:data];
        
        comboLabel = [self newComboLabelWithFrame:CGRectMake(0, 0, frame.size.width - 40, frame.size.height)];
        
        comboButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [comboButton addTarget:self action:@selector(selectButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        comboButton.frame = CGRectMake(comboLabel.frame.size.width + 5, (frame.size.height - 30)/2, 30, 30);
            
        [self addSubview:comboLabel];
        [self addSubview:comboButton];
        
        customActionSheet = [self newCustomActionSheet];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame
{
    if (([super initWithFrame:frame])) 
    {
        
    }
    return self;
}

- (void)dealloc
{
    [comboLabel release];
    [customActionSheet release];
    [super dealloc];
}

#pragma mark - UIPickerView Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return ([dataArray count] + 1);
}

#pragma mark - UIPickerView Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0)
        return @"Please Select";
    else
        return [@"  " stringByAppendingString:[dataArray objectAtIndex:(row - 1)]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (row == 0)
        selectedValue = @"Please Select";
    else
        selectedValue = [dataArray objectAtIndex:(row - 1)];
}

@end

