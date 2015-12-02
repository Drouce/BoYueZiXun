//
//  AppDelegate.m
//  BoYue
//
//  Created by drouce on 15/11/19.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "LeftViewController.h"
#import "ReaderManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [TuWanNetManager getVideoDetailWithId:@"244505"
//     completionHandle:^(id model, NSError *error) {
//         myLog(@"......");
//     }];
//    [TuWanNetManager getPicDetailWithId:@"244564" completionHandle:^(id model, NSError *error) {
//        myLog(@"......");
//    }];
//    [ReaderManager getReadInfoWithCompletionHandle:^(id model, NSError *error) {
//        myLog(@"....");
//    }];
//    [ReaderManager getSubReadInfoWithDocId:@"B996L41700014JB6" completionHandle:^(id model, NSError *error) {
//       myLog(@"..."); 
//    }];
    
    //TabBarViewController *tabVC = [TabBarViewController new];
    self.window.rootViewController = self.sideMenu;
    [self configGlobalUIStyle];
    return YES;
}

-(UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBarTintColor:kNaviBackColor];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kNaviTitleFontSize], NSForegroundColorAttributeName: kNaviTitleColor}];
    
}


- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[TabBarViewController new] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图,图片插件KSImageName，到Github下载
        _sideMenu.view.backgroundColor = kNaviBackColor;
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
