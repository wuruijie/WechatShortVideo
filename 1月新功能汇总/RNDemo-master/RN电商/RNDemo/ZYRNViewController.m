//
//  ZYRNViewController.m
//  RNDemo
//
//  Created by zhouyu on 2018/10/25.
//  Copyright © 2018 zhouyu. All rights reserved.
//

#import "ZYRNViewController.h"
#import <React/RCTRootView.h>

@interface ZYRNViewController ()

@end

@implementation ZYRNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *properties = @{@"name": @"zhangsan"};
    
    NSURL *url = [[NSURL alloc] init];
#if DEBUG
    url = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios&dev=true"];
#else
    url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"NewIndex.jsbundle" ofType:nil]];
#endif
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:url moduleName:@"RNDemo" initialProperties:properties launchOptions:nil];
    self.view = rootView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

@end
