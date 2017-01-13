//
//  MTJiraViewController.m
//  MobileTools
//
//  Created by Aleksandr Movsesyan on 8/8/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MTJiraViewController.h"

@interface MTJiraViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MTJiraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://jira01.corp.linkedin.com:8443/login.jsp";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

@end
