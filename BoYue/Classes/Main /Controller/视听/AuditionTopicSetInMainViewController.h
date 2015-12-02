//
//  AuditionTopicSetInViewController.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//


// 电台点击进入 主界面
#import <UIKit/UIKit.h>

@interface AuditionTopicSetInMainViewController : UIViewController

@property (nonatomic, strong) NSString *cid;
- (instancetype)initWithCid:(NSString *)cid;

@end
