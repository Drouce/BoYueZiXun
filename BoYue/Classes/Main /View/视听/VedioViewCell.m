//
//  VedioViewCell.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VedioViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation VedioViewCell

// 单例模式：保证同一时间只有一个播放器
+ (AVPlayerViewController *)shareInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}

- (void)awakeFromNib {

}
// 点击播放视频
- (IBAction)playVideo:(id)sender {
    
    self.playIV.hidden = YES;
    
    AVPlayer *player = [AVPlayer playerWithURL:self.url];
    [player play];
    [VedioViewCell shareInstance].player = player;
    [sender addSubview:[VedioViewCell shareInstance].view];
    [[VedioViewCell shareInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
}

// 如果按钮复用，需要把cell上的播放器删掉
- (void)prepareForReuse{
    [super prepareForReuse];
    // 判断当前cell是否有播放器，有就删除
    if ([VedioViewCell shareInstance].view.superview == self.iconBtn) {
        [[VedioViewCell shareInstance].view removeFromSuperview];
        [VedioViewCell shareInstance].player = nil;
    }
}




@end
