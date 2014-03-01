//
//  CreateEditTaskViewController.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/1/14.
//
//

#import "CreateEditTaskViewController.h"
#import <Parse/Parse.h>
@interface CreateEditTaskViewController ()
@property (strong, nonatomic) NSArray *categoryTags;
@end

@implementation CreateEditTaskViewController


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
}

- (IBAction)onSaveTapped:(id)sender
{
    CRLTask *newTask = [CRLTask object];
    newTask.name = self.taskNameText.text;
    newTask.taskDescription = self.descriptionText.text;
    newTask.taskDurationMinutes =  [self.durationText.text intValue];
    newTask.categoryTag = self.categoryTagText.text;
   
    newTask.value = [self.valueText.text intValue];
    
    newTask.createdBy = (CRLUser *)[PFUser currentUser];
    newTask.team = newTask.createdBy.team;
    
    [self.apiManager saveTask:newTask Completion:^(BOOL succeeded, NSError *error) {
        NSLog(@"================> %@", @"Save completed");
        [self dismissViewControllerAnimated:YES completion:^{
            //nada
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
