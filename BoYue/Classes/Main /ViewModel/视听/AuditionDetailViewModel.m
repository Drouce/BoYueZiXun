//
//  AuditionDetailViewModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionDetailViewModel.h"
#import "AuditionDetailNetManager.h"
#import "AuditionVideoListModel.h"
@implementation AuditionDetailViewModel

- (instancetype)initWithReplayId:(NSString *)replayId
{
    self = [super init];
    if (self) {
        self.replayId = replayId;
    }
    return self;
}
/** 防御性操作 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert1(NO, @"%s:必须使用initWithReplayId:初始化方法", __func__);
    }
    return self;
}


/** 获取数据 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [AuditionDetailNetManager getAuditionDetailWithReplayId:_replayId CompletionHandel:^(AuditionVideoListModel *model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model.hotPosts];
        completionHandle(error);
    }];
}


/** 多少数据 */
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (AuditionVideoListHotpostsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 头像 */
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].hotSub.timg];
}
/** 名字 */
- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].hotSub.n;
}
/** 来源 */
- (NSString *)sourceForRow:(NSInteger)row{
    return [self modelForRow:row].hotSub.f;
}
/** 点赞数 */
- (NSString *)clickNumberForRow:(NSInteger)row{
    return [self modelForRow:row].hotSub.v;
}
/** 评论 */
- (NSString *)commentForRow:(NSInteger)row{
    return [self modelForRow:row].hotSub.b;
}





@end
