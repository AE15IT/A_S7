//
//  LoginCheckBox.h
//  SM7iOs
//
//  Created by Guo Black on 11-7-31.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginCheckBox : UIButton {
    BOOL isChecked;
}

@property (nonatomic, assign) BOOL isChecked;

- (void) checkBoxClicked;

@end
