//
//  AuditionVideoListModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

/** 视频下方 视频进入model */
#import "BaseModel.h"

@class AuditionVideoListHotpostsModel,AuditinVideoHotPosts1Model,AuditionVideoListHotPosts1ExtModel;
@interface AuditionVideoListModel : BaseModel

@property (nonatomic, copy) NSString *docUrl;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *againstLock;

@property (nonatomic, strong) NSArray<AuditionVideoListHotpostsModel *> *hotPosts;

@property (nonatomic, copy) NSString *audioLock;

@property (nonatomic, copy) NSString *isTagOff;

@end
@interface AuditionVideoListHotpostsModel : NSObject

@property (nonatomic, strong) AuditinVideoHotPosts1Model *hotSub;   // 1

@end

@interface AuditinVideoHotPosts1Model : NSObject

@property (nonatomic, copy) NSString *p;

@property (nonatomic, copy) NSString *a;

@property (nonatomic, copy) NSString *pi;

@property (nonatomic, copy) NSString *b;

@property (nonatomic, copy) NSString *rp;

@property (nonatomic, copy) NSString *fi;

@property (nonatomic, copy) NSString *t;

@property (nonatomic, strong) AuditionVideoListHotPosts1ExtModel *ext;

@property (nonatomic, copy) NSString *u;

@property (nonatomic, copy) NSString *f;

@property (nonatomic, copy) NSString *n;

@property (nonatomic, copy) NSString *timg;

@property (nonatomic, copy) NSString *v;

@end

@interface AuditionVideoListHotPosts1ExtModel : NSObject

@property (nonatomic, copy) NSString *value;

@property (nonatomic, copy) NSString *type;

@end

