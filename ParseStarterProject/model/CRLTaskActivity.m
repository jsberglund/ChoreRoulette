//
//  CRLTaskActivity.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/19/14.
//
//

#import "CRLTaskActivity.h"


@implementation CRLTaskActivity
+ (NSString *)parseClassName {
    return @"TaskActivity";
}

@dynamic task;
@dynamic byUser;
@dynamic dateCompleted;
@dynamic isRandom;
@end
