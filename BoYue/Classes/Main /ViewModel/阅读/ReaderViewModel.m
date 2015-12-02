//
//  ReaderViewModel.m
//  BoYue
//
//  Created by drouce on 15/11/26.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "ReaderViewModel.h"
#import "ReaderModel.h"
#import "ReaderManager.h"


@implementation ReaderViewModel

-(NSInteger)rowNumber {
    return self.dataArr.count;
}

- (RecommendModel *)modelForRow:(NSInteger)row {
    return self.dataArr[row];
   
}

-(NSURL *)iconForRow:(NSInteger)row {
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}

-(NSString *)titleForRow:(NSInteger)row {
    return [self modelForRow:row].title;
}

-(NSString *)docIdForRow:(NSInteger)row {
    return [self modelForRow:row].docid;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [ReaderManager getReadInfoWithCompletionHandle:^(id model, NSError *error) {
//        [self.dataArr addObject:model];
        self.dataArr = model;
        completionHandle(error);
    }];
    
   
}


@end
