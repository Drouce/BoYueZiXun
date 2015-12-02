//
//  AuditionTopicDetailCell.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicDetailCell.h"
@implementation AuditionTopicDetailCell


- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
        _titleLb.textColor = kRGBColor(194, 32, 39);
        
// 添加图片
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"audionews_playlist_playing01"]];
        [self.contentView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.left.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
// 添加titleLb
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(imgV);
            make.left.mas_equalTo(imgV.mas_right).mas_equalTo(5);
        }];
        
// 添加下载按钮
        UIButton *downBtn = [UIButton buttonWithType:0];
        downBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [downBtn setImage:[UIImage imageNamed:@"feedlist_ad_download"] forState:UIControlStateNormal];
        [self.contentView addSubview:downBtn];
        [downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(_titleLb);
            make.right.mas_equalTo(-20);
        }];
        
        
    }
    return _titleLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _timeLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.timeLb.hidden = NO;
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
