//
//  ReaderManager.h
//  BoYue
//
//  Created by drouce on 15/11/25.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "BaseNetManager.h"


@interface ReaderManager : BaseNetManager

+ (id) getReadInfoWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

+ (id)getSubReadInfoWithDocId:(NSString *)docid kCompletionHandle;
@end
