//
//  Person+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by Jerry.Yang on 2020/4/20.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic sex;
@dynamic name;
@dynamic age;

@end
