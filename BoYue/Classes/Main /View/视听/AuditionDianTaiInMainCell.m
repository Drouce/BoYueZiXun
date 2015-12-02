//
//  AuditionDianTaiInCell.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionDianTaiInMainCell.h"

@implementation AuditionDianTaiInMainCell

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = kTitleFont;
    }
    return _titleLB;
}

- (UILabel *)desLB {
    if(_desLB == nil) {
        _desLB = [[UILabel alloc] init];
        _desLB.font = kSubTitleFont;
        _desLB.textColor = kSubTitleColor;
        _desLB.numberOfLines = 0;
    }
    return _desLB;
}

- (UIButton *)clickBT {
    if(_clickBT == nil) {
        _clickBT = [[UIButton alloc] init];
        _clickBT.imageView.contentMode = 2;
        _clickBT.titleLabel.font = [UIFont systemFontOfSize:11];
        [_clickBT setTitleColor:kSubTitleColor forState:UIControlStateNormal];
        [_clickBT setImage:[UIImage imageNamed:@"night_audionews_index_tag"] forState:UIControlStateNormal];
    }
    return _clickBT;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.desLB];
        [self.contentView addSubview:self.clickBT];
        
// 图片
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        // 设置圆角
        _iconIV.layer.cornerRadius = 35;
// 图片上的播放图片
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bobo_recommend_playicon"]];
        [_iconIV addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(_iconIV);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
// 标题
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
// 小标题
        [self.desLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(self.clickBT.mas_left).mas_equalTo(-5);
        }];
// 点击次数: 距离下方10， 右方 10
        [self.clickBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-15);
            make.width.mas_lessThanOrEqualTo(60);
            make.width.mas_greaterThanOrEqualTo(70);
        }];
    }
    return self;
}



@end
