//
//  TaskLogMO.h
//  SecureDataStorageApp
//
//  Created by Екатерина Краснова on 21.01.16.
//  Copyright © 2016 Kate Krasnova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TaskMO;

NS_ASSUME_NONNULL_BEGIN

@interface TaskLogMO : NSManagedObject

- (NSString *)description;

@end

NS_ASSUME_NONNULL_END

#import "TaskLogMO+CoreDataProperties.h"
