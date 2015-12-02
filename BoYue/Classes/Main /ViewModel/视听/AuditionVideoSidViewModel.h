//
//  AuditionVideoSidViewModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//


// 视频 头部点击进入界面
#import "BaseViewModel.h"
#import "AudionVideoSidNetManager.h"
@interface AuditionVideoSidViewModel : BaseViewModel

/**
 *  初始化，设置 type 类型
 *
 *  @param type 数据的类型
 */
- initAuditionVideoSidWithType:(AuditionVidelSidType)type;

@property (nonatomic, assign) NSInteger rowNumber;

- (NSString *)titleWithRow:(NSInteger)row;
- (NSString *)descriptionWithRow:(NSInteger)row;
- (NSURL *)mp4UrlWithRow:(NSInteger)row;
- (NSString *)coverWithRow:(NSInteger)row;

- (NSString *)playCountWithRow:(NSInteger)row; // 播放次数
- (NSString *)lengthWithRow:(NSInteger)row; // 播放时长
- (NSString *)replyCountWithRow:(NSInteger)row; // 评论次数

// replayId 播放传入的 id
- (NSString *)replayIdForRow:(NSInteger)row;


@end
