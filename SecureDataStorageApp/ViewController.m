//
//  ViewController.m
//  SecureDataStorageApp
//
//  Created by Екатерина Краснова on 21.01.16.
//  Copyright © 2016 Kate Krasnova. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "PickerViewHelper.h"

@interface ViewController ()

@property (nonatomic) AppDelegate *appdelegate;

@property (weak, nonatomic) IBOutlet UILabel *toDoCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *logListLabel;

@property (weak, nonatomic) IBOutlet UITextField *taskField;

@property (weak, nonatomic) IBOutlet UIPickerView *taskPicker;
@property (nonatomic) PickerViewHelper *taskPickerHelper;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appdelegate = [[UIApplication sharedApplication]delegate];
    self.taskPickerHelper = [[PickerViewHelper alloc]init];
    [self.taskPicker setDelegate:self.taskPickerHelper];
    [self.taskPicker setDataSource:self.taskPickerHelper];
    
    [self updateTaskRoller];
    [self updateLogList];

}

- (IBAction)addTaskTapped:(id)sender {
    TaskMO *t = [self.appdelegate createTaskMO];
    t.task_name = self.taskField.text;
    [self.appdelegate saveContext];
    [self updateTaskRoller];
    [self.view endEditing:YES];
}

- (IBAction)addTaskToScheduleTapped:(id)sender {
    NSInteger taskRow = [self.taskPicker selectedRowInComponent:0];
    TaskMO *task = (TaskMO *)[self.taskPickerHelper getItemFromArray:taskRow];
    TaskLogMO *taskLog = [self.appdelegate createTaskLogMO];
    
    taskLog.task_to_do = task;
    taskLog.when = self.datePicker.date;
    
    [self.appdelegate saveContext];
    [self updateLogList];

}

- (IBAction)deleteTasksTapped:(id)sender {
    NSManagedObjectContext *moc = self.appdelegate.managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Chore objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    for (TaskMO *t in results) {
        [moc deleteObject:t];
    }
    [self updateTaskRoller];
    
    moc = self.appdelegate.managedObjectContext;
    
    request = [NSFetchRequest fetchRequestWithEntityName:@"TaskLog"];
    error = nil;
    results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Chore objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    for (TaskLogMO *tl in results) {
        [moc deleteObject:tl];
    }
    
    [self.appdelegate saveContext];
    [self updateLogList];
}

- (void) updateTaskRoller {
    NSManagedObjectContext *moc = self.appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Task objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSMutableArray *taskData = [NSMutableArray arrayWithArray:@[]];
    for (TaskMO *t in results) {
        [taskData addObject:t];
    }
    
    self.toDoCountLabel.text = [NSString stringWithFormat:@"To Do List:%lu", (unsigned long)[taskData count]];
    
    [self.taskPickerHelper setArray:taskData];
    [self.taskPicker reloadAllComponents];
}

- (void) updateLogList {
    NSManagedObjectContext *moc = self.appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TaskLog"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching TaskLog objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSMutableString *buffer = [NSMutableString stringWithString:@""];
    for (TaskLogMO *tl in results) {
        [buffer appendFormat:@"\n%@", tl, nil];
    }
    self.logListLabel.text = buffer;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
