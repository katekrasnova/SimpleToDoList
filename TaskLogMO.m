//
//  TaskLogMO.m
//  SecureDataStorageApp
//
//  Created by Екатерина Краснова on 21.01.16.
//  Copyright © 2016 Kate Krasnova. All rights reserved.
//

#import "TaskLogMO.h"
#import "TaskMO.h"

@implementation TaskLogMO

- (NSString *)description {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *date = [dateFormat stringFromDate:self.when];
    return [NSString stringWithFormat:@"%@ - %@", self.task_to_do, date];
}
@end
