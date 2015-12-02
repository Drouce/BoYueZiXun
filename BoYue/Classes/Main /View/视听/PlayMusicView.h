//
//  PlayMusicView.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayMusicView : UIView

+ (PlayMusicView *)sharedInstance;
- (void)playWithURL:(NSURL *)musicURL;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) UIButton *playBtn;

@end
