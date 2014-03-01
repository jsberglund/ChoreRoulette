//
//  CRLUser.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import "CRLUser.h"

@implementation CRLUser 
@dynamic team;
@dynamic nickName;

+ (CRLUser *)currentUser
{
    return (CRLUser *)[PFUser currentUser];
}
@end
