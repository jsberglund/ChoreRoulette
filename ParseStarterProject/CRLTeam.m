//
//  CRLTeam.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import "CRLTeam.h"
#import <Parse/PFObject+Subclass.h>


@implementation CRLTeam
+ (NSString *)parseClassName {
    return @"Team";
}

@dynamic teamId;
@dynamic teamName;
@end
