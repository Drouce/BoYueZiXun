//
//  SubReaderViewModel.m
//  BoYue
//
//  Created by drouce on 15/11/27.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "SubReaderViewModel.h"

#import "ReaderManager.h"

@implementation SubReaderViewModel

-(instancetype)initWithDocId:(NSString *)docId {
    if (self = [super init]) {
        self.docId = docId;
    }
    return self;
}
- (NSString *)titleForRow {
    return self.docModel.title;
}
- (NSString *)sourceForRow {
    return self.docModel.source;
}
- (NSString *)timeForRow {
    return  self.docModel.ptime;
}
- (NSString *)contentForRow {
    return self.docModel.body;
}
- (NSURL *)iconForRow {
    return [NSURL URLWithString:self.docModel.img[0][@"src"]];
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    [ReaderManager getSubReadInfoWithDocId:_docId completionHandle:^(id model, NSError *error) {
        self.docModel = model;
        completionHandle(error);
    }];
}


- (NSURL *)sourceURLForRow {
    return [NSURL URLWithString:self.docModel.source_url];
}

@end
