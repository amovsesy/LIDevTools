//
//  MTRBNavController.h
//  MobileTools
//
//  Created by Aleksandr Movsesyan on 8/9/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTRBNavController : UINavigationController {
    UIViewController *fakeRootViewController;
}

@property(nonatomic, retain) UIViewController *fakeRootViewController;

-(void)setRootViewController:(UIViewController *)rootViewController;

@end