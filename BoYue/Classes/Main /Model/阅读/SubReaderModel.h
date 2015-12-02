//
//  SubReaderModel.h
//  BoYue
//
//  Created by drouce on 15/11/25.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "BaseModel.h"

@class DocIDModel,SourceinfoModel,KeywordSearchModel,RelativeSysModel;
@interface SubReaderModel : BaseModel

@property (nonatomic, strong) DocIDModel *docId;

@end
@interface DocIDModel : NSObject
@property (nonatomic, strong) NSString *source_url;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, strong) NSArray *link;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *apps;

@property (nonatomic, strong) NSArray *boboList;

@property (nonatomic, strong) NSArray *img;

@property (nonatomic, strong) NSArray *topiclist_news;

@property (nonatomic, strong) NSArray *ydbaike;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) BOOL picnews;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, strong) SourceinfoModel *sourceinfo;

@property (nonatomic, copy) NSString *temp;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) BOOL hasNext;

@property (nonatomic, strong) NSArray *topiclist;

@property (nonatomic, copy) NSString *body;

@property (nonatomic, strong) NSArray<KeywordSearchModel *> *keyword_search;

@property (nonatomic, strong) NSArray *votes;

@property (nonatomic, assign) NSInteger threadAgainst;

@property (nonatomic, copy) NSString *voicecomment;

@property (nonatomic, copy) NSString *dkeys;

@property (nonatomic, strong) NSArray *users;

@property (nonatomic, assign) NSInteger threadVote;

@property (nonatomic, strong) NSArray<RelativeSysModel *> *relative_sys;

@property (nonatomic, copy) NSString *digest;

@end

@interface SourceinfoModel : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *ename;

@end

@interface KeywordSearchModel : NSObject

@property (nonatomic, copy) NSString *word;

@end

@interface RelativeSysModel : NSObject

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *href;

@property (nonatomic, copy) NSString *type;

@end

