//
//  AuditionVideoSidModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

// 视频界面上方点击进入的model

#import "BaseModel.h"

@class AuditionVideoSidVap4Bfe3UModel;
@interface AuditionVideoSidModel : BaseModel

@property (nonatomic, strong) NSArray<AuditionVideoSidVap4Bfe3UModel *> *VAP4BFE3U;
@property (nonatomic, strong) NSArray<AuditionVideoSidVap4Bfe3UModel *> *VAP4BFR16;
@property (nonatomic, strong) NSArray<AuditionVideoSidVap4Bfe3UModel *> *VAP4BG6DL;
@property (nonatomic, strong) NSArray<AuditionVideoSidVap4Bfe3UModel *> *VAP4BGTVD;

@end
@interface AuditionVideoSidVap4Bfe3UModel : NSObject

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *m3u8_url;

@end

