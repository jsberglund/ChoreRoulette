//
//  CRLTasksManager.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/19/14.
//
//

#import <Foundation/Foundation.h>
#import "CRLTask.h"
#import "CRLUser.h"
#import "CRLNetworkAccessManager.h"

@interface CRLTasksManager : NSObject
@property (strong, nonatomic) NSMutableArray *tasksArray;

- (id)initWithNetworkManager:(CRLNetworkAccessManager *)networkManager;

-(void)markTaskAsCompleted:(CRLTask *)task
                   forUser:(CRLUser *)user
                  isRandom:(BOOL)isRandom
                Completion:(void(^)(BOOL succeeded, NSError *error))completion;
@end
