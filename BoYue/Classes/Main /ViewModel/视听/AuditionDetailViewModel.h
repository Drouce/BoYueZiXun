//
//  AuditionDetailViewModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface AuditionDetailViewModel : BaseViewModel

@property (nonatomic, strong) NSString *replayId;
- (instancetype)initWithReplayId:(NSString *)replayId;

/** 多少数据 */
@property (nonatomic, assign) NSInteger rowNumber;

/** 头像 */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 名字 */
- (NSString *)nameForRow:(NSInteger)row;
/** 来源 */
- (NSString *)sourceForRow:(NSInteger)row;
/** 点赞数 */
- (NSString *)clickNumberForRow:(NSInteger)row;
/** 评论 */
- (NSString *)commentForRow:(NSInteger)row;

@end
