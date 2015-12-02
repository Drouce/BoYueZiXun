//
//  ReaderManager.m
//  BoYue
//
//  Created by drouce on 15/11/25.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "ReaderManager.h"
#import "ReaderModel.h"
#import "SubReaderModel.h"


#define kReadPath  @"http://c.3g.163.com/recommend/getSubDocPic"
#define kPassPort  @"passport" : @""
#define kDevId  @"devId" : @"DD32DA84-02AF-481C-BF5E-20FECA826AD9"
#define kSize @"size" : @20
#define kVersion  @"version" : @"5.3.4"
#define kSpever  @"spever"  : @false
#define kNet  @"net"  : @"wifi"
#define kLat  @"lat" : @"0.000000"
#define kLon  @"lon" : @"0.000000"
#define kFrom @"from" : @"yuedu"


//http://c.3g.163.com/recommend/getSubDocPic?passport=&devId=DD32DA84-02AF-481C-BF5E-20FECA826AD9&size=20&version=5.3.4&spever=false&net=wifi&lat=0.000000&lon=0.000000&from=yuedu

//http://c.m.163.com/nc/article/B98JPBP400964J4O/full.html
//

@implementation ReaderManager

+(id)getReadInfoWithCompletionHandle:(void (^)(id, NSError *))completionHandle {
    return [self GET:kReadPath parameters:@{kPassPort,kDevId,kSize,kVersion,kSpever,kNet,kLat,kLon,kFrom} completionHandler:^(NSDictionary* responseObj, NSError *error) {
        
        completionHandle([RecommendModel objectArrayWithKeyValuesArray :responseObj[@"推荐"]] ,error);
    }];
}

+(id)getSubReadInfoWithDocId:(NSString *)docid completionHandle:(void (^)(id, NSError *))completionHandle {
    
    NSString *subReadPath = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html",docid];
    return [self GET:subReadPath parameters:nil completionHandler:^(NSDictionary *responseObj, NSError *error) {
        completionHandle([DocIDModel objectWithKeyValues: responseObj[docid]],error);
    }];
}

@end
