//
//  MobToolsCRTLoggedOutViewController.m
//  MobTools
//
//  Created by Aleksandr Movsesyan on 8/10/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MobToolsCRTLoggedOutViewController.h"
#import "MobToolsCRTLoggedInViewController.h"
#import "MobToolsCRTNavController.h"

@interface MobToolsCRTLoggedOutViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation MobToolsCRTLoggedOutViewController

- (void)viewDidLoad {
}

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    NSLog(@"Title: %@, msg: %@", title, msg);
}

- (IBAction)loginPressed {
    @try {
        
        if([self.username.text isEqualToString:@""] || [self.password.text isEqualToString:@""] ) {
            [self alertStatus:@"Please enter both Username and Password" :@"Login Failed!"];
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",self.username.text,self.password.text];
            NSURL *url=[NSURL URLWithString:@"https://tools.corp.linkedin.com/apps/tools/crt/_tools/login"];
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSHTTPCookie *cookie;
            NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
            BOOL found = NO;
            for (cookie in [cookieJar cookies]) {
                NSDate* now = [NSDate date];
                NSDate* earlierDate = [cookie.expiresDate earlierDate:now];
                if (earlierDate == NULL || [earlierDate isEqualToDate:now]) {
                    if ([cookie.name isEqualToString:@"session"] && [cookie.domain isEqualToString:@"tools.corp.linkedin.com"])
                    {
                        MobToolsCRTLoggedInViewController *nextViewController = [[MobToolsCRTLoggedInViewController alloc] init];
                        nextViewController.username = self.username.text;
                        MobToolsCRTNavController *navController = (MobToolsCRTNavController*)self.navigationController;
                        [navController setRootViewController:nextViewController];
                        found = YES;
                    }
                }
            }
            
            if (!found) {
                NSLog(@"Sorry not logged in");
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Login Failed." :@"Login Failed!"];
    }
}

@end
