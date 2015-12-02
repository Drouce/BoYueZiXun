//
//  AuditionTopicDetailViewController.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuditionTopicDetailViewController : UIViewController

@property (nonatomic, strong) NSString *tid;
- (instancetype)initWithTid:(NSString *)tid;

@end
