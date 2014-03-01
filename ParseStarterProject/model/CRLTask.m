//
//  CRLTask.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import "CRLTask.h"
#import <Parse/PFObject+Subclass.h>

@implementation CRLTask
+ (NSString *)parseClassName {
    return @"UserTask";
}
@dynamic taskId;
@dynamic name;
@dynamic taskDescription;
@dynamic team;
@dynamic createdBy;
@dynamic categoryTag;
@dynamic taskDurationMinutes;
@dynamic value;

@end
