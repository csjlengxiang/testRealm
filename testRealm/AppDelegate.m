//
//  AppDelegate.m
//  testRealm
//
//  Created by csj on 16/5/7.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm/Realm.h>
#import "Person.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    RLMMigrationBlock migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        
        NSLog(@"%@", migration.oldSchema);
        NSLog(@"%@", migration.newSchema);
        
        if (oldSchemaVersion < 1) {
            [migration enumerateObjects:Dog.className block:^(RLMObject *oldObject, RLMObject *newObject) {
                
                    // combine name fields into a single field
                //    newObject[@"fullName"] = [NSString stringWithFormat:@"%@ %@", oldObject[@"firstName"], oldObject[@"lastName"]];
                
            }];
        }
        NSLog(@"Migration complete.");
    };
    
    RLMRealmConfiguration *configuration = [RLMRealmConfiguration defaultConfiguration];
    
    
    NSLog(@"%@", configuration.fileURL);
    
    configuration.schemaVersion = 4;
    configuration.migrationBlock = migrationBlock;
    
    [RLMRealmConfiguration setDefaultConfiguration:configuration];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    Dog *dog1 = [[Dog alloc] init];
    dog1.name = @"dog1";
    Dog *dog2 = [[Dog alloc] init];
    dog2.name = @"dog2";
    
    Person *person1 = [[Person alloc] init];
    person1.name = @"person1";
    Person *person2 = [[Person alloc] init];
    person2.name = @"person2";
    
    [realm beginWriteTransaction];
    [realm addObject:dog1];
    [realm addObject:dog2];
    [realm addObject:person1];
    [realm addObject:person2];
    [realm commitWriteTransaction];
    
    NSLog(@"%@", [RLMRealmConfiguration defaultConfiguration].fileURL);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
