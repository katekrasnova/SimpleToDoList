//
//  TaskLogMO+CoreDataProperties.h
//  SecureDataStorageApp
//
//  Created by Екатерина Краснова on 21.01.16.
//  Copyright © 2016 Kate Krasnova. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TaskLogMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaskLogMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *when;
@property (nullable, nonatomic, retain) TaskMO *task_to_do;

@end

NS_ASSUME_NONNULL_END
