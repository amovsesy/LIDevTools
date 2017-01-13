//
//  MTReviewBoardViewController.m
//  MobileTools
//
//  Created by Aleksandr Movsesyan on 8/8/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MTReviewBoardViewController.h"

@interface MTReviewBoardViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MTReviewBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://rb.corp.linkedin.com/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

@end
