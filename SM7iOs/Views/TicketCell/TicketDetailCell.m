//
//  TicketDetailCell.m
//  SM7iOs
//
//  Created by eleven li on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TicketDetailCell.h"


@implementation TicketDetailCell

@synthesize lblKey;
@synthesize lblValue;

- (void)setCellContentWithKey:(NSString *)k value:(NSString *)v{
    self.lblKey.text = k;
    self.lblValue.text = v;
}

- (void)dealloc
{
    [lblKey release];
    [lblValue release];
    
    [super dealloc];
}

@end
