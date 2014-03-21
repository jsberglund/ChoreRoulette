//
//  MenuViewController.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/20/14.
//
//

#import "MenuViewController.h"
#import "TasksListViewController.h"
#import "UIViewController+MMDrawerController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.homeButton.normalBackgroundColor = [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f];
    self.homeButton.normalForegroundColor = [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f];
    [self.homeButton setFlatTitle:@"Home"];
    
    self.tasksButton.normalBackgroundColor = [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f];
    self.tasksButton.normalForegroundColor = [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f];
    [self.tasksButton setFlatTitle:@"Tasks"];
}
- (IBAction)homeTapped:(id)sender
{
    //set controller to main/Home
    //close drawer
}

- (IBAction)tasksListTapped:(id)sender
{
    //set controller to tasks list
    
    TasksListViewController *tasksListViewController = [[TasksListViewController alloc] init];
    UINavigationController *tasksNavController = [[UINavigationController alloc] initWithRootViewController:tasksListViewController];

    [self.mm_drawerController setCenterViewController:tasksNavController];
    
    //close drawer
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        NSLog(@"================> %@", @"Drawer Close");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
