//
//  AuditonDetailCell.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditonDetailCell.h"

@implementation AuditonDetailCell


- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        _iconIV.layer.cornerRadius = 10;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
    }
    return _iconIV;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:16];
        _nameLb.textColor = kRGBColor(85, 127, 166);
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.width.mas_equalTo(200);
        }];
        
    }
    return _nameLb;
}

- (UILabel *)sourceLb {
    if(_sourceLb == nil) {
        _sourceLb = [[UILabel alloc] init];
        _sourceLb.font = [UIFont systemFontOfSize:11];
        _sourceLb.textColor = kRGBColor(156, 156, 156);
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.nameLb);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(200);
        }];
    }
    return _sourceLb;
}

- (UILabel *)commentLb {
    if(_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
        _commentLb.font = [UIFont systemFontOfSize:19];
        _commentLb.numberOfLines = 0;
        [self.contentView addSubview:_commentLb];
        [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.sourceLb);
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(15);
            make.right.mas_equalTo(-40);
            make.bottom.mas_equalTo(-15);
        }];
    }
    return _commentLb;
}


- (UILabel *)clickGoodLb {
    if(_clickGoodLb == nil) {
        _clickGoodLb = [[UILabel alloc] init];
        _clickGoodLb.font = [UIFont systemFontOfSize:11];
        _clickGoodLb.textColor = kRGBColor(156, 156, 156);
        _clickGoodLb.textAlignment = NSTextAlignmentRight;
        
// 点赞图标
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comment_support_hd"]];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        
        [self.contentView addSubview:_clickGoodLb];
        [_clickGoodLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(imageV.mas_left).mas_equalTo(-4);
        }];

    }
    return _clickGoodLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.commentLb.hidden = NO;
        self.clickGoodLb.hidden = NO;
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
