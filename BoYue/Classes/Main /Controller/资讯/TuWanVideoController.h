//
//  TuWanVideoController.h
//  BoYue
//
//  Created by drouce on 15/11/20.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanVideoVIewModel.h"
@interface TuWanVideoController : UIViewController

- (instancetype)initWithAid:(NSString *)aid;
@property (nonatomic, strong) NSString *aid;

@property (nonatomic, strong) TuWanVideoVIewModel *videoViewModel;
@end
