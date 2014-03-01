//
//  CRLNetworkAccessManager.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/1/14.
//
//

#import "CRLNetworkAccessManager.h"
#import <Parse/Parse.h>
#import "CRLTeam.h"
@implementation CRLNetworkAccessManager

-(void)getTasksForTeam:(CRLTeam *)team Completion:(void(^)(NSArray *tasks, NSError *error))completion
{
    PFQuery *query = [PFQuery queryWithClassName:[CRLTask parseClassName]];
    [query whereKey:@"team" equalTo:team];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            completion(objects, error);
        }
    }];
}

-(void)saveTask:(CRLTask *)atask Completion:(void(^)(BOOL succeeded, NSError *error))completion
{
    [atask saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        completion(succeeded, error);
    }];
}


@end
