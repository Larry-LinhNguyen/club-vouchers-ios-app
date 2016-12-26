//
//  AppDelegate.m
//  Clubvouchers
//
//  Created by pnf on 9/28/15.
//  Copyright © 2015 pnf. All rights reserved.
//

#import "AppDelegate.h"
#import "login.h"
#import "dashboard.h"
#import "success_error.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    login *objlogin=[[login alloc]init];
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:objlogin];
    
    self.window.rootViewController=nav;
    [nav setNavigationBarHidden:YES];
    
    sleep(2);
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
