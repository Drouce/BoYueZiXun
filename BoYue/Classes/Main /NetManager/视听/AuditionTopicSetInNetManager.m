//
//  AuditionVideoInModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicSetInNetManager.h"

@implementation AuditionTopicSetInNetManager


//http://c.3g.163.com/nc/topicset/ios/radio/C1420525588210/0-20.html
+ (id)getAuditionViewInModelWithCid:(NSString *)cid page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://c.3g.163.com/nc/topicset/ios/radio/%@/%ld-20.html", cid, page];

    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AuditionTopicSetInModel objectWithKeyValues:responseObj], error);
    }];
    
}


@end
