//
//  XQMVideoNetManager.h
//  网易新闻
//
//  Created by yang_0921 on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//


// 视频 界面数据

#import "BaseNetManager.h"

@interface AuditionVideoNetManager : BaseNetManager

+ (id)getVideoWithIndex:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle;


+ (id)getTopicSetCompletionHandle:(void(^)(id model, NSError *error))completionHandle;



@end
