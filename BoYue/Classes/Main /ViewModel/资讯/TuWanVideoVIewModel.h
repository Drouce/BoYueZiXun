//
//  TuWanVideoVIewModel.h
//  BoYue
//
//  Created by drouce on 15/11/20.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanVideoModel.h"

@interface TuWanVideoVIewModel : BaseViewModel

- (instancetype)initWithAid:(NSString *)aid;

@property (nonatomic, strong) NSString *aid;

//@property (nonatomic) NSInteger rowNumber;
- (NSURL *)videoForRow:(NSInteger)row;

@property (nonatomic, strong) TuWanVideoModel *videoModel;

@end
