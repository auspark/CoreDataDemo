//
//  ViewController.h
//  CoreDataDemo
//
//  Created by Jerry.Yang on 2020/4/20.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

#import "Person+CoreDataClass.h"
#import "Person+CoreDataProperties.h"

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *TFname;
@property (weak) IBOutlet NSTextField *TFAge;
@property (weak) IBOutlet NSTextField *TFSex;
@property (weak) IBOutlet NSTextField *TFPath;

@property (weak) IBOutlet NSTextField *MLText;

@end

