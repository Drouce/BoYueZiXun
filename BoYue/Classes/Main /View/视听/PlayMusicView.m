//
//  PlayMusicView.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayMusicView.h"

@implementation PlayMusicView

+ (PlayMusicView *)sharedInstance{
    static PlayMusicView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [PlayMusicView new];
    });
    return p;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.playBtn.hidden = NO;
    }
    return self;
}

- (UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:0];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"audionews_play_button"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"audionews_pause_button"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_playBtn bk_addEventHandler:^(UIButton *sender) {
            if (sender.selected) {
                [_player pause];
            }else{
                [_player play];
            }
            sender.selected = !sender.selected;
        } forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _playBtn;
}

- (void)playWithURL:(NSURL *)musicURL{
// 设置支持的类别
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
// 激活
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    _player = [AVPlayer playerWithURL:musicURL];
    [_player play];
    self.playBtn.selected = YES;
    
}


@end
