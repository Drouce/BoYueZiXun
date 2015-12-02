//
//  TuWanVideoVIewModel.m
//  BoYue
//
//  Created by drouce on 15/11/20.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "TuWanVideoVIewModel.h"
#import "TuWanNetManager.h"


@implementation TuWanVideoVIewModel

-(instancetype)initWithAid:(NSString *)aid {
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAid初始化方法", __func__);
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [TuWanNetManager getVideoDetailWithId:_aid completionHandle:^(TuWanVideoModel *model, NSError *error) {
        self.videoModel = model;
        completionHandle(error);
    }];
}

//-(NSInteger)rowNumber {
//    return self.videoModel.content.count;
//}
//-(TuWanVideoContentModel *)modelForRow:(NSInteger)row {
//    return self.videoModel.content[row];
//}


- (NSURL *)videoForRow:(NSInteger)row{
    //row : 代表的是表中的的第几行，content[0] : 取到的是video的属性
    TuWanVideoContentModel *model = self.videoModel.content[0];
    return [NSURL URLWithString:model.video];
    
}



@end
