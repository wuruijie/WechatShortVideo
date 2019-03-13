//
//  ViewController.m
//  UnitTestDemoTests
//
//  Created by meitianhui2 on 2018/1/5.
//  Copyright © 2018年 DeLongYang. All rights reserved.
//

#import "ViewController.h"
#import "LoginSuccessViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginClick:(id)sender
{
    if ([self isLogin]) {
        LoginSuccessViewController *loginSuccessVC = [[LoginSuccessViewController alloc] init];
        [self.navigationController pushViewController:loginSuccessVC animated:YES];
    }
}

- (BOOL)isLogin{
    if ([self.userName.text isEqual:@""] || [self.passWord.text isEqual:@""]) {
        return NO;
    }else{
        return YES;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
