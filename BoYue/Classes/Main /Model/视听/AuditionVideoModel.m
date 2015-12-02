//
//  AuditionVideoModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionVideoModel.h"

@implementation AuditionVideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList" : [AuditionVideosidlistModel class], @"videoList" : [AuditionVideoVideolistModel class]};
}
@end
@implementation AuditionVideosidlistModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"des": @"description"};
}
@end


@implementation AuditionVideoVideolistModel

@end


