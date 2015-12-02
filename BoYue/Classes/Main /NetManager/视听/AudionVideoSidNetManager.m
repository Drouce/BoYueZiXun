//
//  AudionVideoSidNetManager.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AudionVideoSidNetManager.h"
#import "AuditionVideoSidModel.h"
@implementation AudionVideoSidNetManager

+ (id)getAuditionVideoSidType:(AuditionVidelSidType)type index:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    
//    NSString *path = @"http://c.m.163.com/nc/video/list/VAP4BFR16/y/0-10.htm";
    
    
//     http://c.m.163.com/nc/video/list/VAP4BFE3U/y/0-10.html
//http://c.m.163.com/nc/video/list/VAP4BFR16/y/0-10.htm
//http://c.m.163.com/nc/video/list/VAP4BG6DL/y/0-10.html
//http://c.m.163.com/nc/video/list/VAP4BGTVD/y/0-10.html
    
    
    NSString *path = @"http://c.m.163.com/nc/video/list/";
    switch (type) {
        case AuditionVidelSidTypeQipa:{
            path = [path stringByAppendingString:@"VAP4BFE3U"];
            break;
        }
        case AuditionVidelSidTypeMengChong:{
            path = [path stringByAppendingString:@"VAP4BFR16"];
            break;
        }
        case AuditionVidelSidTypeMeinv:{
            path = [path stringByAppendingString:@"VAP4BG6DL"];
            break;
        }
        case AuditionVidelSidTypeJingpin:{
            path = [path stringByAppendingString:@"VAP4BGTVD"];
            break;
        }
            
        default:
            break;
    }
    
    NSString *pathTwo = [NSString stringWithFormat:@"/y/%ld-10.html", index];
    path = [path stringByAppendingString:pathTwo];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AuditionVideoSidModel objectWithKeyValues:responseObj], error);
    }];
}

@end
