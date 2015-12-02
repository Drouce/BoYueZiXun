//
//  AuditionTopicDetailModel.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class AuditionTopicDetailArrModel;
@interface AuditionTopicDetailModel : BaseModel

@property (nonatomic, strong) NSArray<AuditionTopicDetailArrModel *> *detailArr;   // T1394711522757

@end
@interface AuditionTopicDetailArrModel : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *TAG;

@property (nonatomic, copy) NSString *url_3w;

@property (nonatomic, assign) NSInteger hasHead;

@property (nonatomic, assign) NSInteger hasImg;

@property (nonatomic, copy) NSString *lmodify;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, copy) NSString *TAGS;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *temp; //template

@property (nonatomic, assign) NSInteger votecount;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, copy) NSString *size;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) BOOL hasIcon;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *boardid;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, copy) NSString *digest;

@end

