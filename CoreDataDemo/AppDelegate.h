//
//  AppDelegate.h
//  CoreDataDemo
//
//  Created by Jerry.Yang on 2020/4/20.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;


@end

