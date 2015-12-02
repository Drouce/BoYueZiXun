//
//  ReaderViewCell.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface ReaderViewCell : UITableViewCell

/** 图片 */
@property (nonatomic, strong) TRImageView *iconIV;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLB;


@end
