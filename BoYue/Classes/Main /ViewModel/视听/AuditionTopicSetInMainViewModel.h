//
//  AuditionTopicSetInMainViewModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "AuditionTopicSetInNetManager.h"
#import "AuditionTopicSetInModel.h"
@interface AuditionTopicSetInMainViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSString *cid;
- (instancetype)initWithCid:(NSString *)cid;

/** 一共有多少数据  */
@property (nonatomic, assign) NSInteger rowNumber;

- (NSURL *)iconForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)desForRow:(NSInteger)row;
- (NSString *)clickNumberForRow:(NSInteger)row;

/** 音乐链接 */
- (NSURL *)musicURLForRow:(NSInteger)row;

/** tid:电台标识 */
- (NSString *)tidForRow:(NSInteger)row;

@end
