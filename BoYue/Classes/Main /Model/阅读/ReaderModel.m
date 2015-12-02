//
//  ReaderModel.m
//  BoYue
//
//  Created by drouce on 15/11/25.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "ReaderModel.h"

@implementation ReaderModel


+ (NSDictionary *)objectClassInArray{
    return @{@"recommend" : [RecommendModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName {
    return @{@"recommend" : @"推荐"};
}
@end

@implementation RecommendModel

+(NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID" : @"id", @"temp" : @"template"};
}
@end


