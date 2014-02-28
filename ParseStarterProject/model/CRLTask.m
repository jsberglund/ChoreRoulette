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
@dynamic taskId;
@dynamic name;
@dynamic taskDescription;
@dynamic taskDuration;
@dynamic team;

+ (NSString *)parseClassName {
    return @"Task";
}
@end
