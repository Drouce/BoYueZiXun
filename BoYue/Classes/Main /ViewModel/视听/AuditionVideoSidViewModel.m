//
//  AuditionVideoSidViewModel.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionVideoSidViewModel.h"
#import "AudionVideoSidNetManager.h"
#import "AuditionVideoSidModel.h"
@interface AuditionVideoSidViewModel ()

@property (nonatomic, assign) AuditionVidelSidType type;

@property (nonatomic, assign) int index;

@end

@implementation AuditionVideoSidViewModel

- (instancetype)initAuditionVideoSidWithType:(AuditionVidelSidType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (AuditionVideoSidVap4Bfe3UModel *)auditionVedioSidWithRow:(NSInteger)row{
    NSLog(@"%@", self.dataArr[row]);
    return self.dataArr[row];
}

- (NSString *)titleWithRow:(NSInteger)row{
    return [self auditionVedioSidWithRow:row].title;
}

- (NSString *)descriptionWithRow:(NSInteger)row{
    return [self auditionVedioSidWithRow:row].des;
}

- (NSString *)coverWithRow:(NSInteger)row{
    return [self auditionVedioSidWithRow:row].cover;
}

- (NSURL *)mp4UrlWithRow:(NSInteger)row{
    return [NSURL URLWithString:[self auditionVedioSidWithRow:row].mp4_url];
}

- (NSString *)playCountWithRow:(NSInteger)row{
    
    NSInteger count = [self auditionVedioSidWithRow:row].playCount;
    if (count >= 10000) {
        return [NSString stringWithFormat:@"%.1lf万", count / 10000.0];
    }
    
    return @(count).stringValue;
}

- (NSString *)lengthWithRow:(NSInteger)row{
    
    NSInteger length = [self auditionVedioSidWithRow:row].length;
    NSInteger minutes = length / 60;
    NSInteger seconds = length % 60;
    
    return [NSString stringWithFormat:@"%02ld:%02ld", minutes, seconds];
}
- (NSString *)replyCountWithRow:(NSInteger)row{
    return @([self auditionVedioSidWithRow:row].replyCount).stringValue;
}


// replayId 播放传入的 id
- (NSString *)replayIdForRow:(NSInteger)row{
    return [self auditionVedioSidWithRow:row].replyid;
}


/**
 *  刷新数据
 */
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
/**
 *  获取更多数据
 */
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index += 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}

/**
 *  获取数据
 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [AudionVideoSidNetManager getAuditionVideoSidType:_type index:_index completionHandle:^(AuditionVideoSidModel *model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
        
        switch (_type) {
            case AuditionVidelSidTypeQipa:{
                // 获取每个 视频内容信息 的数组
                [self.dataArr addObjectsFromArray:model.VAP4BFE3U];
                break;
            }
            case AuditionVidelSidTypeMengChong:{
                // 获取每个 视频内容信息 的数组
                [self.dataArr addObjectsFromArray:model.VAP4BFR16];
                break;
            }
            case AuditionVidelSidTypeMeinv:{
                [self.dataArr addObjectsFromArray:model.VAP4BG6DL];
                break;
            }
            case AuditionVidelSidTypeJingpin:{
                [self.dataArr addObjectsFromArray:model.VAP4BGTVD];
                break;
            }
                
            default:
                break;
        }

        
        // 获取每个 视频内容信息 的数组
        [self.dataArr addObjectsFromArray:model.VAP4BFE3U];
        completionHandle(error);
    }];
}



@end
