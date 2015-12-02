//
//  ReaderViewCell.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReaderViewCell.h"

@implementation ReaderViewCell

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.contentMode = 2;
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = kTitleFont;
        _titleLB.numberOfLines = 0;
    }
    return _titleLB;
}

- (UILabel *)sourceLB {
    if(_sourceLB == nil) {
        _sourceLB = [[UILabel alloc] init];
        _sourceLB.font = kSubTitleFont;
        _sourceLB.textColor = [UIColor lightGrayColor];
    }
    return _sourceLB;
}

- (UIButton *)deleteBT {
    if(_deleteBT == nil) {
        _deleteBT = [[UIButton alloc] init];
//        [_deleteBT setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    return _deleteBT;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.sourceLB];
        [self.contentView addSubview:self.deleteBT];
        
// 图片：
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(self.titleLB.mas_left).mas_equalTo(5);
        }];
// 标题
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
// 来源
        [self.sourceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.bottom.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(0);
        }];
// 删除按钮
        [self.deleteBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 12));
            make.bottom.mas_equalTo(self.sourceLB.mas_bottom).mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
