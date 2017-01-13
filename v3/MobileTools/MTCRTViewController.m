//
//  MTCRTViewController.m
//  MobileTools
//
//  Created by Aleksandr Movsesyan on 8/8/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MTCRTViewController.h"

@interface MTCRTViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MTCRTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://tools.corp.linkedin.com/apps/tools/crt";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

@end
