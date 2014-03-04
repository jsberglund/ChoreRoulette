//
//  TasksListViewController.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/1/14.
//
//

#import <UIKit/UIKit.h>

@interface TasksListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tasksArray;

@end
