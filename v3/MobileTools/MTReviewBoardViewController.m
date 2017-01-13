//
//  MTReviewBoardViewController.m
//  MobileTools
//
//  Created by Aleksandr Movsesyan on 8/8/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MTReviewBoardViewController.h"
#import "MTRBViewController.h"

@interface MTReviewBoardViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MTReviewBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.delegate = self;
    NSString *fullURL = @"https://rb.corp.linkedin.com/account/login/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    BOOL loadUrl = YES;
    
    if ([request.URL.absoluteString isEqual: @"https://rb.corp.linkedin.com/account/login/"]) {
        return loadUrl;
    }
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [cookieJar cookies]) {
        NSDate* now = [NSDate date];
        NSDate* earlierDate = [cookie.expiresDate earlierDate:now];
        if ([cookie.name isEqualToString:@"rbsessionid"] && [earlierDate isEqualToDate:now]) {
            loadUrl = NO;
            NSLog(@"Not loading url second method");
        }
    }
    
    if (!loadUrl) {
        MTRBViewController *nextViewController = [[MTRBViewController alloc] init];
        [self.navigationController pushViewController:nextViewController animated:NO];
    }
    
    return loadUrl;
}

@end
