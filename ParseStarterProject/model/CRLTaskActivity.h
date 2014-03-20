//
//  CRLTaskActivity.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/19/14.
//
//

#import <Foundation/Foundation.h>
#import <Parse/PFObject+Subclass.h>
#import "CRLTask.h"
#import "CRLUser.h"

@interface CRLTaskActivity : PFObject<PFSubclassing>
+ (NSString *)parseClassName;

@property (strong, nonatomic) CRLTask *task;
@property (strong, nonatomic) CRLUser *byUser;
@property (strong, nonatomic) NSDate *dateCompleted;
@property (nonatomic) BOOL isRandom;

@end
