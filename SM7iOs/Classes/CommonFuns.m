//
//  CommonFuns.m
//  SM7iOs
//
//  Created by eleven li on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CommonFuns.h"
#import "SM7iOsAppDelegate.h"


@implementation CommonFuns

+ (UITextField *)newTxtSearchWithTarget:(id)delegate action:(SEL)selector
{
    UITextField *txtSearch = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 6.0, 300.0, 44.0)];    
    txtSearch.borderStyle = UITextBorderStyleRoundedRect;
    txtSearch.font = [UIFont boldSystemFontOfSize:22.0];
    txtSearch.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtSearch.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtSearch.autocorrectionType = UITextAutocorrectionTypeNo;
    txtSearch.enablesReturnKeyAutomatically = NO;
    txtSearch.returnKeyType = UIReturnKeySearch;
    txtSearch.placeholder = @"Ticket #";

    txtSearch.delegate = delegate;
    
    UIImage *image = [UIImage imageNamed:@"btn_search.png"];
    
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSearch.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [btnSearch setBackgroundImage:image forState:UIControlStateNormal];
    [btnSearch addTarget:delegate action:selector forControlEvents:UIControlEventTouchUpInside];
    
    txtSearch.rightViewMode = UITextFieldViewModeAlways;
    txtSearch.rightView = btnSearch;
    
    return txtSearch;
}

+ (UIButton *)newActionButtonWithTitle:(NSString *)title frame:(CGRect)frame
{	
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	button.backgroundColor = [UIColor clearColor];
    
    [button setTitle:title forState:UIControlStateNormal];
	
	UIImage *imageNormal = [[UIImage imageNamed:@"btn_normal.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:imageNormal forState:UIControlStateNormal];
	
	UIImage *imageHighlight = [[UIImage imageNamed:@"btn_highlight.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	[button setBackgroundImage:imageHighlight forState:UIControlStateHighlighted];
  
	return button;
}

+ (UILabel *)createLabelInCell:(NSString *)lblName{
    
    UILabel *lblCell = [[UILabel alloc] initWithFrame:CGRectMake(15, 6, 110, 30)];
    lblCell.backgroundColor = [UIColor clearColor];
    lblCell.textColor = [UIColor whiteColor];
    lblCell.font = [UIFont systemFontOfSize:14]; 
    lblCell.text = lblName;     
    
    return lblCell;
}

@end
