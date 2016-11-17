//
//  TaskMO+CoreDataProperties.h
//  SecureDataStorageApp
//
//  Created by Екатерина Краснова on 21.01.16.
//  Copyright © 2016 Kate Krasnova. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TaskMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaskMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *task_name;
@property (nullable, nonatomic, retain) TaskLogMO *task_log;

@end

NS_ASSUME_NONNULL_END
