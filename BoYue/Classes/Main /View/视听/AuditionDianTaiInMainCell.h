//
//  AuditionDianTaiInCell.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

// 进入电台的 主 cell
#import "BaseNetManager.h"
#import "TRImageView.h"
@interface AuditionDianTaiInMainCell : UITableViewCell

@property (nonatomic, strong) TRImageView *iconIV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *desLB;
// 听过次数 ，取消点击响应
@property (nonatomic, strong) UIButton *clickBT;





@end
