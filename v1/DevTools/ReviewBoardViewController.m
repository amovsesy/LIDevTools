//
//  ReviewBoardViewController.m
//  DevTools
//
//  Created by Aleksandr Movsesyan on 8/6/13.
//  Copyright (c) 2013 Aleksandr Movsesyan. All rights reserved.
//

#import "ReviewBoardViewController.h"

@interface ReviewBoardViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ReviewBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://rb.corp.linkedin.com/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

@end
