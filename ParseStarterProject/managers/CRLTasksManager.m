//
//  CRLTasksManager.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/19/14.
//
//

#import "CRLTasksManager.h"
#import "CRLNetworkAccessManager.h"
#import "CRLTaskActivity.h"

@interface CRLTasksManager ()
@property (strong, nonatomic) CRLNetworkAccessManager *networkManager;
@end

@implementation CRLTasksManager

- (id)initWithNetworkManager:(CRLNetworkAccessManager *)networkManager
{
    self = [super init];
    if (self) {
        self.tasksArray = [@[] mutableCopy];
        self.networkManager = networkManager;
    }
    return self;
}

-(void)markTaskAsCompleted:(CRLTask *)task
                   forUser:(CRLUser *)user
                  isRandom:(BOOL)isRandom
                Completion:(void(^)(BOOL succeeded, NSError *error))completion
{
    CRLTaskActivity *taskActivity = [CRLTaskActivity object];
    taskActivity.task = task;
    taskActivity.byUser = user;
    taskActivity.isRandom = isRandom;
    taskActivity.dateCompleted = [NSDate date];
    
    [self.networkManager saveTaskActivity:taskActivity Completion:^(BOOL succeeded, NSError *error) {
        completion(succeeded, error);
    }];
}


//- (id)initWithTasks:(NSArray *)tasksArray
//{
//    self = [super init];
//    if (self) {
//        self.tasksArray = [tasksArray mutableCopy];
//    }
//    return self;
//}
@end
