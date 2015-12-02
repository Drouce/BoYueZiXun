//
//  AuditionDetailViewController.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

/** 视频点击进入的详情界面 */
#import <UIKit/UIKit.h>

@interface AuditionDetailViewController : UIViewController

- (instancetype)initWithReplayId:(NSString *)replayId mp4URL:(NSURL *)url;
@property (nonatomic, strong) NSString *replayId;
@property (nonatomic, strong) NSURL *url;

@end
