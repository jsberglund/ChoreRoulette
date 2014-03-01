//
//  CRLTask.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/PFObject+Subclass.h>
#import "CRLTeam.h"
#import "CRLUser.h"

@interface CRLTask : PFObject<PFSubclassing>
+ (NSString *)parseClassName;
@property (strong, nonatomic) NSString *taskId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSString *categoryTag;
@property int value;
@property int taskDurationMinutes;
@property (strong, nonatomic) CRLTeam *team;
@property (strong, nonatomic) CRLUser *createdBy;
@end
