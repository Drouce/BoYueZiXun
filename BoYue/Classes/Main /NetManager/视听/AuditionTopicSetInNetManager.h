//
//  AuditionVideoInModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//


// 电台点击进入数据
#import "BaseNetManager.h"
#import "AuditionTopicSetInModel.h"
@interface AuditionTopicSetInNetManager: BaseNetManager


/**
 *  获取电台进入界面数据
 *
 *  @param cid              进入界面传入的cid值
 *  @param page             起始页
 *
 *  @return 返回网络模型
 */
+ (id)getAuditionViewInModelWithCid:(NSString *)cid page:(NSInteger)page completionHandle:(void(^)(id model, NSError *error))completionHandle;



@end
