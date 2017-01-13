//
//  MobToolsAppDelegate.m
//  MobTools
//
//  Created by Aleksandr Movsesyan on 8/10/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MobToolsAppDelegate.h"
#import "MobToolsLIXNavController.h"
#import "MobToolsCRTNavController.h"
#import "MobToolsLIXLoggedInViewController.h"
#import "MobToolsLIXLoggedOutViewController.h"
#import "MobToolsCRTLoggedInViewController.h"
#import "MobToolsCRTLoggedOutViewController.h"

@implementation MobToolsAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    BOOL lixIn = NO;
    BOOL crtIn = NO;
    
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [cookieJar cookies]) {
        NSDate* now = [NSDate date];
        NSDate* earlierDate = [cookie.expiresDate earlierDate:now];
        if (earlierDate == NULL || [earlierDate isEqualToDate:now]) {
            if ([cookie.name isEqualToString:@"session"] && [cookie.domain isEqualToString:@"tools.corp.linkedin.com"]) {
                crtIn = YES;
            } else if ([cookie.name isEqualToString:@"userid"] && [cookie.domain isEqualToString:@"lix.corp.linkedin.com"]) {
                lixIn = YES;
            }
        }
    }
    
    UINavigationController *lixNavController;
    if (lixIn) {
        lixNavController = [[MobToolsLIXNavController alloc] initWithRootViewController:[[MobToolsLIXLoggedInViewController alloc] init]];
    } else {
        lixNavController = [[MobToolsLIXNavController alloc] initWithRootViewController:[[MobToolsLIXLoggedOutViewController alloc] init]];
    }
    UIImage *img3 = [UIImage imageNamed:@"lix_logo"];
    [lixNavController .tabBarItem initWithTitle:@"LIX" image:img3 tag:3];
    
    
    UINavigationController *crtNavController;
    if (crtIn) {
        crtNavController = [[MobToolsCRTNavController alloc] initWithRootViewController:[[MobToolsCRTLoggedInViewController alloc] init]];
    } else {
        crtNavController = [[MobToolsCRTNavController alloc] initWithRootViewController:[[MobToolsCRTLoggedOutViewController alloc] init]];
    }
    UIImage *img4 = [UIImage imageNamed:@"lix_logo"];
    [crtNavController .tabBarItem initWithTitle:@"CRT" image:img4 tag:4];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[lixNavController, crtNavController];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
