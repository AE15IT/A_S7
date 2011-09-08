//
//  Combobox.h
//  SM7iOs
//
//  Created by Black on 11-9-5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Combobox : UIView <UIPickerViewDelegate, UIPickerViewDataSource>
{   
    NSArray *dataArray;
    UILabel *comboLabel;
    UIButton *comboButton;
    UIActionSheet *customActionSheet;
    NSString *selectedValue;
}

//---The text of comboLabel indicates the current selected value----
@property (nonatomic, retain) UILabel *comboLabel;

//---The Combobox's height is recommended to greater than 30 pixels     ---
//---Pass the data that you want to display in select list as dataSource---
//
- (id)initComboboxWithFrame:(CGRect)frame dataSource:(NSArray *)data;

@end
