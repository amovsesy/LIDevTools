//
//  JiraViewController.m
//  DevTools
//
//  Created by Aleksandr Movsesyan on 8/6/13.
//  Copyright (c) 2013 Aleksandr Movsesyan. All rights reserved.
//

#import "JiraViewController.h"

@interface JiraViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation JiraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://jira01.corp.linkedin.com:8443/login.jsp";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

@end
