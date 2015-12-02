//
//  XQMVideoNetManager.m
//  网易新闻
//
//  Created by yang_0921 on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionVideoNetManager.h"
#import "AuditionVideoModel.h"
#import "AuditionTopicSetModel.h"
@implementation AuditionVideoNetManager

// http://c.m.163.com/nc/video/home/0-10.html    0表示显示从0开始   10表示10个数据
+ (id)getVideoWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", index];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AuditionVideoModel objectWithKeyValues:responseObj], error);
    }];
}

/**
 *  获取电台内容
 */
+ (id)getTopicSetCompletionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = @"http://c.m.163.com/nc/topicset/ios/radio/index.html";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AuditionTopicSetModel objectWithKeyValues:responseObj], error);
    }];
}


@end
