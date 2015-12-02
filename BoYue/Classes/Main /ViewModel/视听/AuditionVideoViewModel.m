//
//  XQMVideoViewModel.m
//  网易新闻
//
//  Created by yang_0921 on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionVideoViewModel.h"
#import "AuditionVideoModel.h"
#import "AuditionVideoNetManager.h"
@implementation AuditionVideoViewModel
- (NSMutableArray *)sidDataArr{
    if (!_sidDataArr) {
        _sidDataArr = [NSMutableArray array];
    }
    return _sidDataArr;
}


// 视频上边部分
- (NSUInteger)sidRowNumber{
    return self.sidDataArr.count;
}
- (AuditionVideosidlistModel *)videoSidListModelWithRow:(NSInteger)row{
    return self.sidDataArr[row];
}
- (NSString *)sidIconWithRow:(NSInteger)row{
    return [self videoSidListModelWithRow:row].imgsrc;
}
- (NSString *)sidTitleWithRow:(NSInteger)row{
    return [self videoSidListModelWithRow:row].title;
}

// 视频内容

- (NSUInteger)rowNumber{
    return self.dataArr.count;
}

- (AuditionVideoVideolistModel *)videoLidstModelWithRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)titleWithRow:(NSInteger)row{
    return [self videoLidstModelWithRow:row].title;
}

- (NSString *)desWithRow:(NSInteger)row{
    return [self videoLidstModelWithRow:row].des;
}
- (NSString *)playCountWithRow:(NSInteger)row{
    
    NSInteger count = [self videoLidstModelWithRow:row].playCount;
    if (count >= 10000) {
        return [NSString stringWithFormat:@"%.1lf万", count / 10000.0];
    }
    
    return @(count).stringValue;
}
- (NSString *)mp4UrlWithRow:(NSInteger)row{
    return [self videoLidstModelWithRow:row].mp4_url;
}
- (NSString *)coverWithRow:(NSInteger)row{
    return [self videoLidstModelWithRow:row].cover;
}
- (NSString *)lengthWithRow:(NSInteger)row{
    
    NSInteger length = [self videoLidstModelWithRow:row].length;
    NSInteger minutes = length / 60;
    NSInteger seconds = length % 60;
    
    return [NSString stringWithFormat:@"%02ld:%02ld", minutes, seconds];
}

- (NSString *)replyCountWithRow:(NSInteger)row{
    return @([self videoLidstModelWithRow:row].replyCount).stringValue;
}

// replayId 播放传入的 id
- (NSString *)replayIdForRow:(NSInteger)row{
    return [self videoLidstModelWithRow:row].replyid;
}


// 获取数据

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
//- (void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    
    [AuditionVideoNetManager getVideoWithIndex:_index completionHandle:^(AuditionVideoModel *model, NSError *error) {
        
        if (_index == 0) {
            // 视频上端部分
            [self.sidDataArr removeAllObjects];
            [self.sidDataArr addObjectsFromArray:model.videoSidList];
            
            [self.dataArr removeAllObjects];
        }
        
        // 添加视频内容
        [self.dataArr addObjectsFromArray:model.videoList];
        
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index += 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}





@end
