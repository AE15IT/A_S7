//
//  LoginCheckBox.m
//  SM7iOs
//
//  Created by Guo Black on 11-7-31.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LoginCheckBox.h"


@implementation LoginCheckBox

@synthesize isChecked;

- (id) initWithFrame:(CGRect)frame
{
    if (([super initWithFrame:frame])) 
    {
        [self setIsChecked:NO];
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self setImage:[UIImage imageNamed:@"btn_uncheck.png"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(checkBoxClicked) forControlEvents:UIControlEventTouchUpInside];
        
        [self setTitle:@" Save password" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

- (void)checkBoxClicked
{
    if(self.isChecked == NO)
    {
		self.isChecked = YES;
		[self setImage:[UIImage imageNamed:@"btn_checked.png"] forState:UIControlStateNormal];
	}
    else
    {
		self.isChecked = NO;
		[self setImage:[UIImage imageNamed:@"btn_uncheck.png"] forState:UIControlStateNormal];
	}
}

- (void)dealloc
{
    [super dealloc];
}

@end
