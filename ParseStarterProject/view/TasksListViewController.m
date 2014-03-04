//
//  TasksListViewController.m
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/1/14.
//
//

#import "TasksListViewController.h"

@interface TasksListViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation TasksListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

# pragma mark TableView Delegate


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
