//
//  MobToolsCRTNavController.h
//  MobTools
//
//  Created by Aleksandr Movsesyan on 8/10/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobToolsCRTNavController : UINavigationController {
    UIViewController *fakeRootViewController;
}

@property(nonatomic, retain) UIViewController *fakeRootViewController;

-(void)setRootViewController:(UIViewController *)rootViewController;

@end
