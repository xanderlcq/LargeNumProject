//
//  AppDelegate.h
//  LargeNumProject
//
//  Created by Xander on 2/14/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property(readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

