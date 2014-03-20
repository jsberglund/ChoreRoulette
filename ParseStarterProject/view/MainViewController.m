//
//  MainViewController.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 2/27/14.
//
//

#import "MainViewController.h"
#import <Parse/Parse.h>
#import <MMDrawerController/MMDrawerBarButtonItem.h>
#import "UIViewController+MMDrawerController.h"


#import "CRLLoginViewController.h"
#import "CRLTeam.h"
#import "CRLUser.h"
#import "CreateEditTaskViewController.h"
#import "TasksListViewController.h"
#import "CRLNetworkAccessManager.h"
#import "CRLTasksManager.h"

@interface MainViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *teamNameTextField;
@property (strong, nonatomic) CRLNetworkAccessManager *apiManager;
@property (strong, nonatomic) CRLTasksManager *tasksManager;
@property (strong, nonatomic) CRLTask *selectedTask;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.apiManager = [[CRLNetworkAccessManager alloc] init];
        self.tasksManager = [[CRLTasksManager alloc] initWithNetworkManager:self.apiManager];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupLeftMenuButton];
    [self loadTasksForTeam];
    
}

-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

-(void)loadTasksForTeam
{
    //show HUD (add pod)
    //load tasks into manager
    [self.apiManager getTasksForTeam:[CRLUser currentUser].team Completion:^(NSArray *tasks, NSError *error) {
        self.tasksManager.tasksArray = [tasks mutableCopy];
        self.selectTaskButton.enabled = YES;
    }];

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

- (IBAction)selectTaskTapped:(UIButton *)sender
{
    int r = arc4random() % (self.tasksManager.tasksArray.count);
    NSLog(@"================> random number %d", r);
    
    self.selectedTask = self.tasksManager.tasksArray[r];
    
    self.taskNameLabel.text = self.selectedTask.name;
    self.taskValueLabel.text =  [NSString stringWithFormat:@"%d", self.selectedTask.value];
}

- (IBAction)markTaskCompletedTapped:(id)sender
{
    [self.tasksManager markTaskAsCompleted:self.selectedTask forUser:[CRLUser currentUser] isRandom:YES Completion:^(BOOL succeeded, NSError *error) {
        NSLog(@"================> %@", @"Task completed!");
    }];
}


#pragma mark - Login Controller
// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length && password.length) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    NSLog(@"User dismissed the logInViewController");
}


#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || !field.length) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Example Parse calls


- (IBAction)showTasksTapped:(id)sender
{
    TasksListViewController *tasksListController = [[TasksListViewController alloc] init];
    
    [self.apiManager getTasksForTeam:[CRLUser currentUser].team Completion:^(NSArray *tasks, NSError *error) {
        tasksListController.tasksArray = tasks;
        
        [self.navigationController pushViewController:tasksListController animated:YES];
    }];
}

- (IBAction)createTaskTapped:(id)sender {
    CreateEditTaskViewController *createTaskController = [[CreateEditTaskViewController alloc] init];
    
    createTaskController.apiManager = self.apiManager;
    
    [self.apiManager getTasksForTeam:[CRLUser currentUser].team Completion:^(NSArray *tasks, NSError *error) {
        
        NSMutableArray *taskCategories = [@[] mutableCopy];
        for (CRLTask *task in tasks) {
            if (task.categoryTag) {
                [taskCategories addObject:task.categoryTag];
            }
        }
        
        createTaskController.existingCategoryTags = taskCategories;
        
        [self.navigationController pushViewController:createTaskController animated:YES];
    }];
    
    
    
}
- (IBAction)getUsersInTeamTapped:(id)sender {
    
    PFQuery *innerQuery = [PFQuery queryWithClassName:[CRLTeam parseClassName]];
    [innerQuery whereKey:@"teamName" equalTo:self.teamNameTextField.text];
    PFQuery *query = [PFQuery queryWithClassName:[CRLUser parseClassName]];
    [query whereKey:@"team" matchesQuery:innerQuery];
    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
        // users now in team with specified team name
        NSLog(@"================> %lu", (unsigned long)users.count);
    }];
    
    
}
- (IBAction)showUserTeam:(id)sender {
    //update team
    CRLUser *currentCRLUser = (CRLUser *)[PFUser currentUser];
    
    NSLog(@"================> %@", currentCRLUser.team.objectId);
    
    PFQuery *query = [PFQuery queryWithClassName:[CRLTeam parseClassName]];
    [query getObjectInBackgroundWithId:currentCRLUser.team.objectId block:^(PFObject *team, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", team);
        currentCRLUser.team = (CRLTeam *)team;
        
        //we can even change it, yo
        //currentCRLUser.team.teamName = @"CHANGED";
        //[currentCRLUser.team saveInBackground];
    }];
    
}
- (IBAction)createTeamTapped:(id)sender {
    CRLTeam *newTeam = [CRLTeam object];
    newTeam.teamName = self.teamNameTextField.text;
    [newTeam saveInBackground];
    NSLog(@"================> %@", @"Team Saved");
}
- (IBAction)joinTeamTapped:(id)sender {
    //current user
    CRLUser *currentCRLUser = (CRLUser *)[PFUser currentUser];
    
    //get team based on name?
    PFQuery *query = [PFQuery queryWithClassName:[CRLTeam parseClassName]];
    [query whereKey:@"teamName" equalTo:self.teamNameTextField.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d teams.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object);
                CRLTeam *foundTeam = (CRLTeam *)object;
                currentCRLUser[@"team"] = foundTeam;
                [currentCRLUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    NSLog(@"================> %@", @"SAVE SUCEEDED");
                }];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

@end
