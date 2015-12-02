//
//  VedioViewCell.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VedioViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;



/** 播放次数按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playCountBT;
/** 时长按钮 */
@property (weak, nonatomic) IBOutlet UIButton *durationBT;
/** 播放图片 */
@property (weak, nonatomic) IBOutlet UIImageView *playIV;
/** 评论次数 */
@property (weak, nonatomic) IBOutlet UIButton *commentBT;

@property (nonatomic, strong) NSURL *url;


@end
