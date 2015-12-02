//
//  AuditionTopicSetViewModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//
#import "AuditionTopicSetViewModel.h"

#import "AuditionVideoNetManager.h"
@implementation AuditionTopicSetViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (AuditionVideoTopicSetClistModel *)topicSetWithRow:(NSInteger)row{
    return self.dataArr[row];
}

// 存储这详细的信息
- (NSArray *)tlistWithRow:(NSInteger)row{
    return [self topicSetWithRow:row].tList;
}

- (AuditionTopicSetClistTlistModel *)tlistModelForRow:(NSInteger)row Index:(NSInteger)index{
    return [self tlistWithRow:row][index];
}

- (AuditionTopicSetClistTlistRadioModle *)radioModelForRow:(NSInteger)row index:(NSInteger)index{
    return [self tlistModelForRow:row Index:index].radio;
}

- (NSString *)cnameWithRow:(NSInteger)row{
    return [self topicSetWithRow:row].cname;
}


- (NSString *)tnameWithRow:(NSInteger)row Index:(NSInteger)index{
    AuditionTopicSetClistTlistModel *list = [self tlistWithRow:row][index];
    return list.tname;
}

- (NSInteger)playCountWithRow:(NSInteger)row Index:(NSInteger)index{
    AuditionTopicSetClistTlistModel *list = [self tlistWithRow:row][index];
    return list.playCount;
}

- (NSString *)titleWithRow:(NSInteger)row Index:(NSInteger)index{
    
    AuditionTopicSetClistTlistModel *list = [self tlistWithRow:row][index];
    return list.radio.title;
}

- (NSString *)cidForRow:(NSInteger)row{
    return [self topicSetWithRow:row].cid;
}

/** 图片数组 */
- (NSArray *)imgsrcsInListForRow:(NSInteger)row{
    
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger count = [self tlistWithRow:row].count;
    for (int i = 0; i < count; i++) {
        [arr addObject:[NSURL URLWithString:[self radioModelForRow:row index:i].imgsrc]];
    }
    return [arr copy];
}


- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [AuditionVideoNetManager getTopicSetCompletionHandle:^(AuditionTopicSetModel *model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model.cList];
        completionHandle(error);
    }];
}




@end
