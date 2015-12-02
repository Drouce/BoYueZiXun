//
//  XQMVideoViewModel.h
//  网易新闻
//
//  Created by yang_0921 on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//



// 视频界面
#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
@interface AuditionVideoViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger index;

// 视频上边部分
@property (nonatomic, strong) NSMutableArray *sidDataArr;
@property (nonatomic, assign) NSUInteger sidRowNumber;
- (NSString *)sidIconWithRow:(NSInteger)row;
- (NSString *)sidTitleWithRow:(NSInteger)row;

// 视频部分


@property (nonatomic, assign) NSUInteger rowNumber;

//"playCount": 9815,
//"description": "网友：技术给满分",
//"mp4_url": "http://flv2.bn.netease.com/videolib3/1511/02/PeKJn9156/SD/PeKJn9156-mobile.mp4",
//"ptime": "2015-11-02 07:03:36"
- (NSString *)titleWithRow:(NSInteger)row; // 标题
- (NSString *)desWithRow:(NSInteger)row; // 详情
- (NSString *)mp4UrlWithRow:(NSInteger)row; // 视频地址
- (NSString *)coverWithRow:(NSInteger)row; // 图片
- (NSString *)playCountWithRow:(NSInteger)row; // 播放次数
- (NSString *)lengthWithRow:(NSInteger)row; // 播放时长
- (NSString *)replyCountWithRow:(NSInteger)row; // 评论次数

// replayId 播放传入的 id
- (NSString *)replayIdForRow:(NSInteger)row;



@end
