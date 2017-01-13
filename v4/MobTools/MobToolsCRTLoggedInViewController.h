//
//  MobToolsCRTLoggedInViewController.h
//  MobTools
//
//  Created by Aleksandr Movsesyan on 8/10/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobToolsCRTLoggedInViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, retain) NSDictionary *wars;
@property(nonatomic, retain) NSArray *myWars;
@property(nonatomic,retain) NSString *username;
@property(nonatomic) NSInteger numElements;
@end
