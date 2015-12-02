//
//  TuWanVideoController.m
//  BoYue
//
//  Created by drouce on 15/11/20.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "TuWanVideoController.h"
#import "TuWanVideoModel.h"


@interface TuWanVideoController ()

@property (nonatomic, strong) TuWanVideoModel *videoModel;
@end

@implementation TuWanVideoController

-(instancetype)initWithAid:(NSString *)aid {
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (TuWanVideoVIewModel *)videoViewModel {
    if(_videoViewModel == nil) {
        _videoViewModel = [[TuWanVideoVIewModel alloc] initWithAid:_aid];
    }
    return _videoViewModel;
}



@end
