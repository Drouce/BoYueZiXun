//
//  DRSinaLoginViewController.m
//  FastRun
//
//  Created by drouce on 15/11/18.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "DRSinaLoginViewController.h"
#import "TabBarViewController.h"
#import "LeftViewController.h"
#define  APPKEY       @"3893301452"
#define  REDIRECT_URI @"http://www.tedu.cn"
#define  APPSECRET    @"c5d9ce0901e2bcffefd10f1c0c8cd513"


@interface DRSinaLoginViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
//@property (nonatomic, strong) RESideMenu *sideMenu;
@end

@implementation DRSinaLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString  *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@"
                         ,APPKEY,REDIRECT_URI];
    NSURL  *url = [NSURL URLWithString:urlStr];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

/**返回*/
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 实现webview协议方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    myLog(@"%@",request.URL.absoluteString);
    NSString *urlPath = request.URL.absoluteString;
    NSString *str = [NSString stringWithFormat:@"%@%@",REDIRECT_URI,@"/?code="];
    
    NSRange range = [urlPath rangeOfString:str];
    
    NSString *code = nil;
    if (range.length > 0) {
        code = [urlPath substringFromIndex:range.length];
        [self accessWithCode:code];
        //myLog(@"%@",code);
        return NO;
    }
    return YES;
}

- (void)accessWithCode:(NSString *)code {
    NSString *url = @"https://api.weibo.com/oauth2/access_token";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"client_id"] = APPKEY;
    parameters[@"client_secret"] = APPSECRET;
    parameters[@"grant_type"] = @"authorization_code";
    parameters[@"code"] = code;
    parameters[@"redirect_uri"] = REDIRECT_URI;
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    /*uid ：用户名  access_token :密码*/
        NSString *uidName = [NSString stringWithFormat:@"sina%@",responseObject[@"uid"]];
        [DRUserInfo sharedDRUserInfo].userName = uidName;
        [DRUserInfo sharedDRUserInfo].userPasswd = @"oauth2";
        [DRUserInfo sharedDRUserInfo].userRegisterName = uidName;
        [DRUserInfo sharedDRUserInfo].userRegisterPwd = @"oauth2";
        [DRUserInfo  sharedDRUserInfo].registerType = YES;
        
        [DRUserInfo sharedDRUserInfo].sinaToken = responseObject[@"access_token"];
        
        __weak typeof(self) sinaVc = self;
        [[DRXMPPTool sharedDRXMPPTool]userRegister:^(DRXMPPResult type) {
            [sinaVc handleRegisterResult:type];
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self showErrorMsg:error.localizedDescription];
    }];
    //NSDictionary *params = [NSDictionary dictionary];
    
}

- (void)handleRegisterResult:(DRXMPPResult)type {
    //无论注册成功还是失败都会直接登陆
    [DRUserInfo sharedDRUserInfo].registerType = NO;
    __weak typeof(self) selfVC = self;
    [[DRXMPPTool sharedDRXMPPTool]userLogin:^(DRXMPPResult type) {
        [selfVC handleLoginResult:type];
    }];
     
}


- (void)handleLoginResult:(DRXMPPResult)type {
    switch (type) {
        case DRXMPPResultNetError:
            [MBProgressHUD showError:@"网络错误请检查网络" toView:self.view];
            break;
        case DRXMPPResultLoginSuccess:{
            [DRUserInfo sharedDRUserInfo].sinaLogin = YES;
            [self.sideMenuViewController setContentViewController:[TabBarViewController new] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        }
        case DRXMPPResultLoginFaild:
            [MBProgressHUD showError:@"登陆失败" toView:self.view];
            break;
        default:
            break;
    }
}
//- (RESideMenu *)sideMenu{
//    if (!_sideMenu) {
//        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[TabBarViewController new] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
//        //为sideMenu设置背景图,图片插件KSImageName，到Github下载
//        _sideMenu.view.backgroundColor = kNaviBackColor;
//        //可以让出现菜单时不显示状态栏
//        _sideMenu.menuPrefersStatusBarHidden = YES;
//    }
//    return _sideMenu;
//}
@end
