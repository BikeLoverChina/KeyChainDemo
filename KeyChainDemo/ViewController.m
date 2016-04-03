//
//  ViewController.m
//  KeyChainDemo
//
//  Created by Apple on 16/4/3.
//  Copyright © 2016年 ywj. All rights reserved.
//

#import "ViewController.h"
#import <Security/Security.h>
#import "JNKeychain.h"

@interface ViewController ()
// 用户名
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

// 密码
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

/* 
 1.下载keychainwrapper，然后拖入到工程
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// read点击事件
- (IBAction)readButtonDidClicked:(id)sender {
    
    NSString *username = [JNKeychain loadValueForKey:@"username"];
    NSString *password = [JNKeychain loadValueForKey:@"password"];
    if (username.length > 0 && password.length > 0) {
        self.usernameTextField.text = username;
        self.passwordTextField.text = password;
        [self showAlertWithTitle:@"Success!" withMessage:@"读取成功" withActionTitle:@"确定"];
    }
    else
    {
        [self showAlertWithTitle:@"Error" withMessage:@"暂无用户信息" withActionTitle:@"确定"];
    }
}

// write点击事件
- (IBAction)writeButtonDidClicked:(id)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    if (username.length > 0 && password.length > 0) {
        // 存入用户名
        [JNKeychain saveValue:username forKey:@"username"];
        
        // 存入密码
        [JNKeychain saveValue:password forKey:@"password"];
        [self showAlertWithTitle:@"Success!" withMessage:@"写入成功" withActionTitle:@"确定"];
    }
    else
    {
        [self showAlertWithTitle:@"Error" withMessage:@"请输入完整信息" withActionTitle:@"确定"];
    }
}

- (void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)message withActionTitle:(NSString *)actionTitle
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"~~~~~");
    }]];
    [self presentViewController:alertVC animated:YES completion:^{
    }];
}

@end
