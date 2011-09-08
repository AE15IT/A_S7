//
//  Ticket.h
//  SM7iOs
//
//  Created by eleven li on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ticket : NSObject {
    NSString *num;
    NSString *priorty;
    NSString *group;
    NSString *cc;
    NSString *status;
    NSString *assignment;
    NSString *assignee;
    NSString *title;
    NSString *desc;
    NSString *journalUpdate;
    NSString *closureCode;
    NSString *closureComments;
    NSString *category;
    NSString *phase;
    NSString *denyReason;
}

@property (nonatomic, retain) NSString *num;
@property (nonatomic, retain) NSString *priorty;
@property (nonatomic, retain) NSString *group;
@property (nonatomic, retain) NSString *cc;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *assignment;
@property (nonatomic, retain) NSString *assignee;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSString *journalUpdate;
@property (nonatomic, retain) NSString *closureCode;
@property (nonatomic, retain) NSString *closureComments;
@property (nonatomic, retain) NSString *category;
@property (nonatomic, retain) NSString *phase;
@property (nonatomic, retain) NSString *denyReason;

- (id)initWithNum: (NSString *)num priorty:(NSString *)priorty group:(NSString *)group cc:(NSString *)cc status:(NSString *)status category:(NSString *)category phase:(NSString *)phase;

@end
