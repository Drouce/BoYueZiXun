//
//  AuditionTopicDetailNetManager.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicDetailNetManager.h"
#import "AuditionTopicDetailModel.h"

#define kAuditionTopicDetailPath(page, tid)     [NSString stringWithFormat:\
@"http://c.3g.163.com/nc/article/list/%@/%ld-20.html", tid, page]

@implementation AuditionTopicDetailNetManager

+ (id)getAuditionTopicDetailNetManagerWithTid:(NSString *)tid page:(NSInteger)page completionHandle:(void(^)(id model, NSError *error))completionHandle{

    return [self GET:@"http://c.3g.163.com/nc/article/list/T1394711522757/0-20.html" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([AuditionTopicDetailModel objectWithKeyValues:responseObj], error);
    }];
}

@end
