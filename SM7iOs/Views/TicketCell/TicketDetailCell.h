//
//  TicketDetailCell.h
//  SM7iOs
//
//  Created by eleven li on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TicketDetailCell : UITableViewCell {
    UILabel *lblKey;
    UILabel *lblValue;
}

@property (nonatomic, retain) IBOutlet UILabel *lblKey;
@property (nonatomic, retain) IBOutlet UILabel *lblValue;

- (void)setCellContentWithKey:(NSString *)k value:(NSString *)v;

@end
