//
//  DRRegisterViewController.m
//  FastRun
//
//  Created by drouce on 15/11/17.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "DRRegisterViewController.h"


@interface DRRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPwd;

@end

@implementation DRRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setTextIcon:self.userName iconName:@"icon"];
    [self setTextIcon:self.userPwd iconName:@"lock"];

}

/** 代码重构 */
- (void)setTextIcon:(UITextField *)textField iconName:(NSString *)icon{
    UIImageView *lefticon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:icon]];
    lefticon.frame = CGRectMake(0, 0, 55, 20);
    lefticon.contentMode = UIViewContentModeCenter;
    textField.leftView = lefticon;
    textField.leftViewMode = UITextFieldViewModeAlways;
}


- (IBAction)registerClick:(id)sender {
    
    [DRUserInfo sharedDRUserInfo].registerType = YES;
    NSString *userName = self.userName.text;
    NSString *userPwd = self.userPwd.text;
    [DRUserInfo sharedDRUserInfo].userRegisterName = userName;
    [DRUserInfo sharedDRUserInfo].userRegisterPwd = userPwd;
    
    __weak typeof(self) myVc = self;
    [[DRXMPPTool sharedDRXMPPTool] userRegister:^(DRXMPPResult type) {
        [myVc handleXmppResult:type];
    }];
}



- (void)handleXmppResult:(DRXMPPResult)type {
    switch (type) {
        case DRXMPPResultNetError:
            myLog(@"网络错误");
            break;
            
        case DRXMPPResultRegisterSuccess: {
            [MBProgressHUD showSuccess:@"注册成功" toView:self.view];
            [DRUserInfo sharedDRUserInfo].userName = [DRUserInfo sharedDRUserInfo].userRegisterName;
            [DRUserInfo sharedDRUserInfo].userPasswd = [DRUserInfo sharedDRUserInfo].userRegisterPwd;
            
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        }
            case DRXMPPResultRegisterFaild:
            [MBProgressHUD showError:@"注册失败，用户名已存在"];
            //myLog(@"注册失败");
            break;
        default:
            break;
    }
}

- (IBAction)cancleClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
