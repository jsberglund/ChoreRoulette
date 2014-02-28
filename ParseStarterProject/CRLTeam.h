//
//  CRLTeam.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/PFObject+Subclass.h>


@interface CRLTeam : PFObject<PFSubclassing>
+ (NSString *)parseClassName;
@property (strong, nonatomic) NSString *teamId;
@property (strong, nonatomic) NSString *teamName;

@end
