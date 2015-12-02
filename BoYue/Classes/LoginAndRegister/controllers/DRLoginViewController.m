//
//  DRLoginViewController.m
//  FastRun
//
//  Created by drouce on 15/11/17.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "DRLoginViewController.h"
#import "TuWanViewController.h"
#import "LeftViewController.h"
#import "TabBarViewController.h"

@interface DRLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (nonatomic, strong) RESideMenu *sideMenu;
@end

@implementation DRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[Factory addMenuItemToVC:self];
}

- (void)handleXmppResult:(DRXMPPResult) type{
    switch (type) {
        case DRXMPPResultNetError:
            myLog(@"网络错误");
            break;
        case DRXMPPResultLoginSuccess:{
            myLog(@"登录成功");
            /** 跳转主界面 */
            [self.sideMenuViewController setContentViewController:[TabBarViewController new] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        }
        case DRXMPPResultLoginFaild:
            myLog(@"登录失败");
            break;
        default:
            break;
    }
}

- (IBAction)login:(UIButton *)sender {
    
    NSString *userName = self.nameText.text;
    NSString *userPassWord = self.pwdText.text;
    [DRUserInfo sharedDRUserInfo].userName = userName;
    [DRUserInfo sharedDRUserInfo].userPasswd = userPassWord;
    
    __weak typeof(self) logVc = self;
    [[DRXMPPTool sharedDRXMPPTool] userLogin:^(DRXMPPResult type) {
        [logVc handleXmppResult:type];
    }];
    
    
}

/**
 *  处理登录的返回状态
 */

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setTextIcon:self.nameText iconName:@"icon"];
    [self setTextIcon:self.pwdText iconName:@"lock"];
    if ([DRUserInfo sharedDRUserInfo].userName) {
        self.nameText.text = [DRUserInfo sharedDRUserInfo].userName;
    }
}


- (void)setTextIcon:(UITextField *)textField iconName:(NSString *)icon{
    UIImageView *lefticon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:icon]];
    lefticon.frame = CGRectMake(0, 0, 55, 20);
    lefticon.contentMode = UIViewContentModeCenter;
    textField.leftView = lefticon;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)dealloc {
    myLog(@"self=%@",self);
}

@end
