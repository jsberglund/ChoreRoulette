//
//  CRLNetworkAccessManager.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/1/14.
//
//

#import <Foundation/Foundation.h>
#import "CRLTask.h"

@interface CRLNetworkAccessManager : NSObject

-(void)getTasksForTeam:(CRLTeam *)team Completion:(void(^)(NSArray *tasks, NSError *error))completion;
-(void)saveTask:(CRLTask *)atask Completion:(void(^)(BOOL succeeded, NSError *error))completion;

@end
