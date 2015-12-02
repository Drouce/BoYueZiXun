//
//  TabBarViewController.m
//  BoYue
//
//  Created by drouce on 15/11/20.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "TabBarViewController.h"
#import "TuWanViewController.h"
#import "ReaderViewController.h"
#import "AuditionVideoViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myLog(@"name:%@",[DRUserInfo sharedDRUserInfo].userName);
    self.tabBar.translucent = NO;
    TuWanViewController *tuWanVC = [TuWanViewController standardTuWanNavi];
    AuditionVideoViewController *videoVC = [AuditionVideoViewController sharedStance];
    
    ReaderViewController *readVC = [ReaderViewController sharedStance];
    [self addItem:tuWanVC title:@"资讯" imageName:@"tabbar_icon_news_normal" selectedImage:@"tabbar_icon_news_highlight"];
    [self addItem:videoVC title:@"视听" imageName:@"tabbar_icon_media_normal" selectedImage:@"tabbar_icon_media_highlight"];
    [self addItem:readVC title:@"阅读" imageName:@"tabbar_icon_reader_normal" selectedImage:@"tabbar_icon_reader_highlight"];
}


- (void)addItem:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    
        vc.title = title;
    
    // 正常状态下照片
    vc.tabBarItem.image = [self imageAlwaysOriginal:imageName];
    
    // 选择时照片
    vc.tabBarItem.selectedImage = [self imageAlwaysOriginal:selectedImageName];
    
    [self addChildViewController:vc];
}

#pragma mark - 取消图片渲染
- (UIImage *)imageAlwaysOriginal:(NSString *)imageName{
    // 正常状态下照片
    UIImage *image = [UIImage imageNamed:imageName];
    if ([[UIDevice currentDevice].systemVersion doubleValue]>7.0) {
        // 声明这张图片用原图
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return image;
}
@end
