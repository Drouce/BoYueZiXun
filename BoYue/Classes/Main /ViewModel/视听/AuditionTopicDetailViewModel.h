//
//  AuditionTopicDetailViewModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface AuditionTopicDetailViewModel : BaseViewModel

- (instancetype)initWithTid:(NSString *)tid;
@property (nonatomic, strong) NSString *tid;


/** 多少个数据 */
@property (nonatomic, assign) NSInteger rowNumber;

/** 标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 时间 */
- (NSString *)timeForRow:(NSInteger)row;



@end
