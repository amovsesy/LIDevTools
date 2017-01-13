//
//  MTLixViewController.m
//  MobileTools
//
//  Created by Aleksandr Movsesyan on 8/8/13.
//  Copyright (c) 2013 LinkedIn. All rights reserved.
//

#import "MTLixViewController.h"

@interface MTLixViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MTLixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://lix.corp.linkedin.com/signin";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

@end
