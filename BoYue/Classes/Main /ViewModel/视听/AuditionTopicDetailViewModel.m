//
//  AuditionTopicDetailViewModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicDetailViewModel.h"
#import "AuditionTopicDetailNetManager.h"
#import "AuditionTopicDetailModel.h"

@interface AuditionTopicDetailViewModel()
@property (nonatomic, assign) NSInteger page;
@end

@implementation AuditionTopicDetailViewModel

- (instancetype)initWithTid:(NSString *)tid
{
    self = [super init];
    if (self) {
        self.tid = tid;
    }
    return self;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    [AuditionTopicDetailNetManager getAuditionTopicDetailNetManagerWithTid:_tid page:_page completionHandle:^(AuditionTopicDetailModel *model, NSError *error) {
       
        if (_page == 0) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
        
        [self.dataArr addObjectsFromArray:model.detailArr];
        completionHandle(error);
    }];
    
}


- (AuditionTopicDetailArrModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 多少个数据 */
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

/** 标题 */
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/** 时间 */
- (NSString *)timeForRow:(NSInteger)row{
    return [self modelForRow:row].ptime;
}


@end
