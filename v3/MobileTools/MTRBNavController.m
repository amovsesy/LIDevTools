//
//  MTRBNavController.m
//  MobileTools
//
//  Created by Aleksandr Movsesyan on 8/9/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MTRBNavController.h"
#import "MTRBViewController.h"
#import "MTReviewBoardViewController.h"

@interface MTRBNavController ()

@end

@implementation MTRBNavController
@synthesize fakeRootViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    MTReviewBoardViewController *loggedoutController = [[MTReviewBoardViewController alloc] init];
    [self initWithRootViewController:loggedoutController];
//    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [cookieJar cookies]) {
        NSDate* now = [NSDate date];
        NSDate* earlierDate = [cookie.expiresDate earlierDate:now];
        if ([cookie.name isEqualToString:@"rbsessionid"] && [earlierDate isEqualToDate:now]) {
            MTRBViewController *loggedinController = [[MTRBViewController alloc] init];
            [self setRootViewController:loggedinController];
        }
    }
}

//override the standard init
-(id)initWithRootViewController:(UIViewController *)rootViewController {
    //create the fake controller and set it as the root
    UIViewController *fakeController = [[UIViewController alloc] init];
    if (self = [super initWithRootViewController:fakeController]) {
        self.fakeRootViewController = fakeController;
        //hide the back button on the perceived root
        rootViewController.navigationItem.hidesBackButton = YES;
        //push the perceived root (at index 1)
        [self pushViewController:rootViewController animated:NO];
    }
    return self;
}

//override to remove fake root controller
-(NSArray *)viewControllers {
    NSArray *viewControllers = [super viewControllers];
    if (viewControllers != nil && viewControllers.count > 0) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:viewControllers];
        [array removeObjectAtIndex:0];
        return array;
    }
    return viewControllers;
}

//override so it pops to the perceived root
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    //we use index 0 because we overrided “viewControllers”
    return [self popToViewController:[self.viewControllers objectAtIndex:0] animated:animated];
}

//this is the new method that lets you set the perceived root, the previous one will be popped (released)
-(void)setRootViewController:(UIViewController *)rootViewController {
    rootViewController.navigationItem.hidesBackButton = YES;
    [self popToViewController:fakeRootViewController animated:NO];
    [self pushViewController:rootViewController animated:NO];
}

@end
