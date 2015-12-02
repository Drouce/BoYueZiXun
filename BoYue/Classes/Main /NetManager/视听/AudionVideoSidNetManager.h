//
//  AudionVideoSidNetManager.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//


// 视频 上方  奇葩， 萌宠等的数据

#import "BaseNetManager.h"

// http://c.m.163.com/nc/video/list/VAP4BFE3U/y/0-10.html

typedef NS_ENUM(NSUInteger, AuditionVidelSidType) {
    AuditionVidelSidTypeQipa = 0,
    AuditionVidelSidTypeMengChong,
    AuditionVidelSidTypeMeinv,
    AuditionVidelSidTypeJingpin
};

@interface AudionVideoSidNetManager : BaseNetManager

/**
 *  获取  奇葩， 萌宠等的数据
 *
 *  @param type  传入类型：奇葩还是萌宠
 *  @param index 获取的第一条数据位置
 *
 *  @return 返回数据
 */
+ (id)getAuditionVideoSidType:(AuditionVidelSidType)type index:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
