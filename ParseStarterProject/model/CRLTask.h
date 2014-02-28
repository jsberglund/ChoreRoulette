//
//  CRLTask.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import <UIKit/UIKit.h>
//#import <Parse/PFObject.h>
#import <Parse/PFObject+Subclass.h>
#import "CRLTeam.h"

@interface CRLTask : PFObject<PFSubclassing>
+ (NSString *)parseClassName;
@property (strong, nonatomic) NSString *taskId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *taskDescription;
@property (nonatomic) NSTimeInterval *taskDuration;
@property (strong, nonatomic) CRLTeam *team;

@end
