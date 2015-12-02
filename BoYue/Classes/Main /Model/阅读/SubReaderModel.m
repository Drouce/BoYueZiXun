//
//  SubReaderModel.m
//  BoYue
//
//  Created by drouce on 15/11/25.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "SubReaderModel.h"

@implementation SubReaderModel



@end



@implementation DocIDModel

+ (NSDictionary *)objectClassInArray{
    return @{@"keyword_search" : [KeywordSearchModel class], @"relative_sys" : [RelativeSysModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName {
    return @{@"temp" : @"template"};
}
@end


@implementation SourceinfoModel

@end


@implementation KeywordSearchModel

@end


@implementation RelativeSysModel

+(NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}
@end


