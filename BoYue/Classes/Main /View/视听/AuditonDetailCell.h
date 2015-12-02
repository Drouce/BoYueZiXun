//
//  AuditonDetailCell.h
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

/** 视频详情cell */

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface AuditonDetailCell : UITableViewCell

/** 头像图片 */
@property (nonatomic, strong) TRImageView *iconIV;
/** 名字 */
@property (nonatomic, strong) UILabel *nameLb;
/** 来源 */
@property (nonatomic, strong) UILabel *sourceLb;
/** 评论 */
@property (nonatomic, strong) UILabel *commentLb;
/** 点赞数 */
@property (nonatomic, strong) UILabel *clickGoodLb;



@end
