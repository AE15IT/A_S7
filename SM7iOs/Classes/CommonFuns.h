//
//  CommonFuns.h
//  SM7iOs
//
//  Created by eleven li on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonFuns : NSObject {
    
}

//---Return a TextField With Placeholder "Ticket #" and a Button with image 
//---"btn_search.png" in its right view
//
+ (UITextField *)newTxtSearchWithTarget:(id)delegate action:(SEL)selector;

+ (UIButton *)newActionButtonWithTitle:(NSString *)title frame:(CGRect)frame;

+ (UILabel *)createLabelInCell:(NSString *)lblName;

@end
