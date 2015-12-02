//
//  AuditionTopicSetInMainViewModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicSetInMainViewModel.h"

@implementation AuditionTopicSetInMainViewModel

- (instancetype)initWithCid:(NSString *)cid
{
    self = [super init];
    if (self) {
        self.cid = cid;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert1(NO, @"%s:必须使用initWithCid方法进行初始化", __func__);
    }
    return self;
}



- (AuditionTopicSetInMainTlistModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (AuditionTopicSetInMainTlistRadioModel *)radioModelForRow:(NSInteger)row{
    return [self modelForRow:row].radio;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (NSURL *)iconForRow:(NSInteger)row{
    [NSURL URLWithString:[self radioModelForRow:row].imgsrc];
    return [NSURL URLWithString:[self radioModelForRow:row].imgsrc];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].tname;
}
- (NSString *)desForRow:(NSInteger)row{
    return [self radioModelForRow:row].title;
}
- (NSString *)clickNumberForRow:(NSInteger)row{
    
    NSInteger count = [self modelForRow:row].playCount;
    if (count >= 10000) {
        return [NSString stringWithFormat:@"%.1lf万", count / 10000.0];
    }
    
    return [NSString stringWithFormat:@"%ld", [self modelForRow:row].playCount];
}

/** 音乐链接 */
- (NSURL *)musicURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self radioModelForRow:row].url];
}

/** tid:电台标识 */
- (NSString *)tidForRow:(NSInteger)row{
    return [self modelForRow:row].tid;
}

/**
 *  获取数据
 */
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

//- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
//    _page += 20;
//    [self getDataFromNetCompleteHandle:completionHandle];
//}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    [AuditionTopicSetInNetManager getAuditionViewInModelWithCid:self.cid page:self.page completionHandle:^(AuditionTopicSetInModel *model, NSError *error) {
        
        if (self.page == 0) {
            [self.dataArr removeAllObjects];
            self.dataArr = nil;
        }
        
        [self.dataArr addObjectsFromArray:model.tList];
        completionHandle(error);
    }];
    

    
}


@end
