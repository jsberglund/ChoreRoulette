//
//  CRLUser.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//
#import <UIKit/UIKit.h>
#import <Parse/PFUser.h>
#import "CRLTeam.h"

@interface CRLUser : PFUser<PFSubclassing>
@property (strong, nonatomic) CRLTeam *team;
@property (strong, nonatomic) NSString *nickName;
@end
