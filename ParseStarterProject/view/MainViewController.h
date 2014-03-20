//
//  MainViewController.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MainViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskValueLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectTaskButton;

@end
