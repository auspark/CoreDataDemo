//
//  Person+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by Jerry.Yang on 2020/4/20.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *sex;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;

@end

NS_ASSUME_NONNULL_END
