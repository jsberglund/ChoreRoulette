//
//  MainViewController.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import "MainViewController.h"
#import <Parse/Parse.h>

#import "CRLLoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
	
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    PFUser *user = [PFUser currentUser];
    if (!user) { // No user logged in
        // Create the log in view controller
        CRLLoginViewController *logInViewController = [[CRLLoginViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
