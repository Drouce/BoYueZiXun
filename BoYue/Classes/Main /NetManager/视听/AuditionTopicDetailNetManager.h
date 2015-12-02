//
//  AuditionTopicDetailNetManager.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface AuditionTopicDetailNetManager : BaseNetManager

+ (id)getAuditionTopicDetailNetManagerWithTid:(NSString *)tid page:(NSInteger)page completionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
