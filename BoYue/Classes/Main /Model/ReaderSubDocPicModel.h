//
//  ReaderSubDocPicModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ReaderSubDocPicCommendModel,ReaderSubDocPicCommendImgnewextraModel;
@interface ReaderSubDocPicModel : BaseModel

@property (nonatomic, strong) NSArray<ReaderSubDocPicCommendModel *> *commend;

@end
@interface ReaderSubDocPicCommendModel : NSObject

@property (nonatomic, assign) NSInteger downTimes;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;   // 来源

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *title;    // 标题

@property (nonatomic, assign) NSInteger imgType;

@property (nonatomic, copy) NSString *TAG;

@property (nonatomic, copy) NSString *img;      // 图片路径

@property (nonatomic, assign) NSInteger picCount;

@property (nonatomic, strong) NSArray<NSString *> *unlikeReason;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, copy) NSString *TAGS;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *prompt;

@property (nonatomic, assign) NSInteger clkNum;

@property (nonatomic, copy) NSString *pixel;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *temp; //template

@property (nonatomic, assign) NSInteger upTimes;

@property (nonatomic, copy) NSString *ID; // id

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *program;

@property (nonatomic, assign) NSInteger recType;

@property (nonatomic, strong) NSArray<ReaderSubDocPicCommendImgnewextraModel *> *imgnewextra;

@property (nonatomic, copy) NSString *boardid;

@property (nonatomic, copy) NSString *recReason;

@property (nonatomic, copy) NSString *digest;   // 小标题

@end

@interface ReaderSubDocPicCommendImgnewextraModel : NSObject

@property (nonatomic, copy) NSString *imgsrc;

@end

