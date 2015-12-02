//
//  AuditionVideoListModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionVideoListModel.h"

@implementation AuditionVideoListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"hotPosts" : [AuditionVideoListHotpostsModel class]};
}
@end
@implementation AuditionVideoListHotpostsModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"hotSub": @"1"};
}

@end


@implementation AuditinVideoHotPosts1Model

@end


@implementation AuditionVideoListHotPosts1ExtModel

@end


