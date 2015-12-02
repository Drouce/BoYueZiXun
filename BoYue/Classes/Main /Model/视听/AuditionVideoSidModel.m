//
//  AuditionVideoSidModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionVideoSidModel.h"

@implementation AuditionVideoSidModel


+ (NSDictionary *)objectClassInArray{
    return @{@"VAP4BFE3U" : [AuditionVideoSidVap4Bfe3UModel class],
             @"VAP4BFR16" : [AuditionVideoSidVap4Bfe3UModel class],
             @"VAP4BG6DL" : [AuditionVideoSidVap4Bfe3UModel class],
             @"VAP4BGTVD" : [AuditionVideoSidVap4Bfe3UModel class]};
}
@end
@implementation AuditionVideoSidVap4Bfe3UModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"des": @"description"};
}

@end


