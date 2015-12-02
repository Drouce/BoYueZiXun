//
//  AuditionTopicSetModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicSetModel.h"

@implementation AuditionTopicSetModel


+ (NSDictionary *)objectClassInArray{
    return @{@"cList" : [AuditionVideoTopicSetClistModel class]};
}
@end
@implementation AuditionVideoTopicSetClistModel

+ (NSDictionary *)objectClassInArray{
    return @{@"tList" : [AuditionTopicSetClistTlistModel class]};
}

@end


@implementation AuditionTopicSetClistTlistModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"temp": @"template"};
}

@end


@implementation AuditionTopicSetClistTlistRadioModle

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"temp": @"template"};
}

@end


