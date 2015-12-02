//
//  AuditionTopicSetViewModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//


// 电台 界面
#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "AuditionTopicSetModel.h"
@interface AuditionTopicSetViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger rowNumber;

- (NSString *)cnameWithRow:(NSInteger)row;  // 每个item的标题
- (NSString *)tnameWithRow:(NSInteger)row Index:(NSInteger)index;  // 每个的标题
- (NSString *)titleWithRow:(NSInteger)row Index:(NSInteger)index;   // 标题
- (NSInteger)playCountWithRow:(NSInteger)row Index:(NSInteger)index; // 播放次数
- (NSString *)cidForRow:(NSInteger)row; // cid

/** 图片数组 */
- (NSArray *)imgsrcsInListForRow:(NSInteger)row;

- (AuditionTopicSetClistTlistRadioModle *)radioModelForRow:(NSInteger)row index:(NSInteger)index;

@end
