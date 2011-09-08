//
//  Ticket.m
//  SM7iOs
//
//  Created by eleven li on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Ticket.h"


@implementation Ticket

@synthesize num;
@synthesize priorty;
@synthesize cc;
@synthesize status;
@synthesize group;
@synthesize assignee;
@synthesize assignment;
@synthesize desc;
@synthesize closureCode;
@synthesize closureComments;
@synthesize journalUpdate;
@synthesize title;
@synthesize category;
@synthesize phase;
@synthesize denyReason;

- (id)init{
    self = [super init];
    
    if (self) {
        self.num = nil;
        self.priorty = nil;
        self.cc = nil;
        self.group = nil;
        self.status = nil;
        self.desc = nil;
        self.category = nil;
        self.phase = nil;
    }
    
    return self;
}

- (id)initWithNum:(NSString *)n priorty:(NSString *)p group:(NSString *)g cc:(NSString *)c status:(NSString *)s category:(NSString *)cat phase:(NSString *)pha{
    self = [super init];
    
    if (self) {
        self.num = n;
        self.priorty = p;
        self.cc = c;
        self.group = g;
        self.status = s;
        self.category = cat;
        self.phase = pha;
    }
    
    return self;
}

@end
