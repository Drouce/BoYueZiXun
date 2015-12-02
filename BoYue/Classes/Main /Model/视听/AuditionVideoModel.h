//
//  AuditionVideoModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class AuditionVideosidlistModel,AuditionVideoVideolistModel;
@interface AuditionVideoModel : BaseModel

@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<AuditionVideosidlistModel *> *videoSidList;

@property (nonatomic, strong) NSArray<AuditionVideoVideolistModel *> *videoList;

@end
@interface AuditionVideosidlistModel : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

@end

@interface AuditionVideoVideolistModel : NSObject

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

