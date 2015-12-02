//
//  AuditionDetailNetManager.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface AuditionDetailNetManager : BaseNetManager


@property (nonatomic, strong) NSString *replayId;
/**
 *  获取视频详情界面数据
 */
+ (id)getAuditionDetailWithReplayId:(NSString *)replayId CompletionHandel:(void(^)(id model, NSError *error))completionHandle;

@end
