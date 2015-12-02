//
//  SubReaderViewModel.h
//  BoYue
//
//  Created by drouce on 15/11/27.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "BaseViewModel.h"
#import "SubReaderModel.h"
@interface SubReaderViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
- (NSURL *)sourceURLForRow;

-(instancetype)initWithDocId:(NSString *)docId;
@property (nonatomic, strong) NSString *docId;
@property (nonatomic, strong) DocIDModel *docModel;

- (NSString *)titleForRow;
- (NSString *)sourceForRow;
- (NSString *)timeForRow;
- (NSString *)contentForRow;
- (NSURL *)iconForRow;
@end
