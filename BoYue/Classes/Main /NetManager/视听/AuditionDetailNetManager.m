//
//  AuditionDetailNetManager.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionDetailNetManager.h"
#import "AuditionVideoListModel.h"
#define kAuditionDetailPath(replayId)  [NSString stringWithFormat:@"http://comment.api.163.com/api/json/post/list/new/hot/video_bbs/%@/0/10/10/2/2", replayId]

@implementation AuditionDetailNetManager

+ (id)getAuditionDetailWithReplayId:(NSString *)replayId CompletionHandel:(void (^)(id, NSError *))completionHandle{
    
    
    
    return [self GET:kAuditionDetailPath(replayId) parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([AuditionVideoListModel objectWithKeyValues:responseObj], error);
    }];
}


@end
