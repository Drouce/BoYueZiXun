//
//  AuditionTopicDetailModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicDetailModel.h"

@implementation AuditionTopicDetailModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"detailArr": @"T1394711522757",
             @"temp": @"template"
             };
}

+ (NSDictionary *)objectClassInArray{
    return @{@"detailArr" : [AuditionTopicDetailArrModel class]};
}
@end
@implementation AuditionTopicDetailArrModel

@end


