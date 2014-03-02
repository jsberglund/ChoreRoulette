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
    //[self setSimulateLatency:YES]; //Uncomment to delay the return of autocomplete suggestions.
    //[self setTestWithAutoCompleteObjectsInsteadOfStrings:YES]; //Uncomment to return autocomplete objects instead of strings to the textfield.
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowWithNotification:) name:UIKeyboardDidShowNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHideWithNotification:) name:UIKeyboardDidHideNotification object:nil];
    
    //Supported Styles:
    //[self.autocompleteTextField setBorderStyle:UITextBorderStyleBezel];
    //[self.autocompleteTextField setBorderStyle:UITextBorderStyleLine];
    //[self.autocompleteTextField setBorderStyle:UITextBorderStyleNone];
    [self.autocompleteTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    //[self.autocompleteTextField setShowAutoCompleteTableWhenEditingBegins:YES];
    //[self.autocompleteTextField setAutoCompleteTableBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
//    [self.autocompleteTextField setAutoCompleteTableAppearsAsKeyboardAccessory:NO];
    
    [self.autocompleteTextField setAutoCompleteTableAppearsAsKeyboardAccessory:YES];
    
}

//- (void)keyboardDidShowWithNotification:(NSNotification *)aNotification
//{
//    [UIView animateWithDuration:0.3
//                          delay:0
//                        options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         CGPoint adjust;
//                         switch (self.interfaceOrientation) {
//                             case UIInterfaceOrientationLandscapeLeft:
//                                 adjust = CGPointMake(-110, 0);
//                                 break;
//                             case UIInterfaceOrientationLandscapeRight:
//                                 adjust = CGPointMake(110, 0);
//                                 break;
//                             default:
//                                 adjust = CGPointMake(0, -60);
//                                 break;
//                         }
//                         CGPoint newCenter = CGPointMake(self.view.center.x+adjust.x, self.view.center.y+adjust.y);
//                         [self.view setCenter:newCenter];
//                      
//                         
//                     }
//                     completion:nil];
//}


//- (void)keyboardDidHideWithNotification:(NSNotification *)aNotification
//{
//    [UIView animateWithDuration:0.3
//                          delay:0
//                        options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         CGPoint adjust;
//                         switch (self.interfaceOrientation) {
//                             case UIInterfaceOrientationLandscapeLeft:
//                                 adjust = CGPointMake(110, 0);
//                                 break;
//                             case UIInterfaceOrientationLandscapeRight:
//                                 adjust = CGPointMake(-110, 0);
//                                 break;
//                             default:
//                                 adjust = CGPointMake(0, 60);
//                                 break;
//                         }
//                         CGPoint newCenter = CGPointMake(self.view.center.x+adjust.x, self.view.center.y+adjust.y);
//                         [self.view setCenter:newCenter];
//                         
//                     }
//                     completion:nil];
//    
//    
//    [self.autocompleteTextField setAutoCompleteTableViewHidden:NO];
//}

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MLPAutoCompleteTextField DataSource


//example of asynchronous fetch:
- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
 possibleCompletionsForString:(NSString *)string
            completionHandler:(void (^)(NSArray *))handler
{
    handler(self.existingCategoryTags);
}

#pragma mark - MLPAutoCompleteTextField Delegate


//- (BOOL)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
//          shouldConfigureCell:(UITableViewCell *)cell
//       withAutoCompleteString:(NSString *)autocompleteString
//         withAttributedString:(NSAttributedString *)boldedString
//        forAutoCompleteObject:(id<MLPAutoCompletionObject>)autocompleteObject
//            forRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    //This is your chance to customize an autocomplete tableview cell before it appears in the autocomplete tableview
//    NSString *filename = [autocompleteString stringByAppendingString:@".png"];
//    filename = [filename stringByReplacingOccurrencesOfString:@" " withString:@"-"];
//    filename = [filename stringByReplacingOccurrencesOfString:@"&" withString:@"and"];
//    [cell.imageView setImage:[UIImage imageNamed:filename]];
//    
//    return YES;
//}

- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
  didSelectAutoCompleteString:(NSString *)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(selectedObject){
        NSLog(@"selected object from autocomplete menu %@ with string %@", selectedObject, [selectedObject autocompleteString]);
    } else {
        NSLog(@"selected string '%@' from autocomplete menu", selectedString);
    }
}



@end
