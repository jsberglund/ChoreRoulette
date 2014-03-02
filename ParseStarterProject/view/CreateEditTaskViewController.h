//
//  CreateEditTaskViewController.h
//  ChoreRoulette
//
//  Created by Jessica Berglund on 3/1/14.
//
//

#import <UIKit/UIKit.h>
#import "CRLNetworkAccessManager.h"
#import <MLPAutoCompleteTextField.h>

@interface CreateEditTaskViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *taskNameText;
@property (weak, nonatomic) IBOutlet UITextField *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *durationText;
@property (weak, nonatomic) IBOutlet UITextField *categoryTagText;

@property (weak, nonatomic) IBOutlet UITextField *valueText;

@property (strong, nonatomic) NSArray *existingCategoryTags;
@property (strong, nonatomic) CRLNetworkAccessManager *apiManager;
@property (weak, nonatomic) IBOutlet MLPAutoCompleteTextField *autocompleteTextField;
@end
