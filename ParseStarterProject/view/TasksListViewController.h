//
//  TasksListViewController.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/1/14.
//
//

#import <UIKit/UIKit.h>
#import "CRLTasksManager.h"

@interface TasksListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tasksArray;
@property (strong, nonatomic) CRLTasksManager *taskManager;

@end
