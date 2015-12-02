//
//  SubReaderViewController.m
//  BoYue
//
//  Created by drouce on 15/11/27.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "SubReaderViewController.h"
#import "TRImageView.h"

@interface SubReaderViewController ()

@property (nonatomic, strong)UILabel *titleLb;
@property (nonatomic, strong) UILabel *sourceLb;
@property (nonatomic, strong) UILabel *timeLb;
@property (nonatomic, strong) UILabel *contentLb;
@property (nonatomic, strong) TRImageView *iconView;
@property (nonatomic, strong) UIView *allView;
@property (nonatomic, strong) UIScrollView *scroll;
@end

@implementation SubReaderViewController

-(instancetype)initWithDocId:(NSString *)docId {
    if (self = [super init]) {
        self.docId = docId;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.scroll];
//    [self.scroll mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.mas_equalTo(0);
//    }];
    self.scroll.backgroundColor = [UIColor lightGrayColor];
    if(!self.subReaderVM.docModel.source_url) {
        [self.subReaderVM getDataFromNetCompleteHandle:^(NSError *error) {
//            if (self.subReaderVM.docModel.source_url) {
//                self.titleLb.hidden = YES;
//                self.sourceLb.hidden = YES;
//                self.timeLb.hidden = YES;
//                self.contentLb.hidden = YES;
//                self.iconView.hidden = YES;
//                [self.view addSubview:self.webView];
//            } else {
            
                self.titleLb.text = [self.subReaderVM titleForRow];
                self.sourceLb.text = [self.subReaderVM sourceForRow];
                self.timeLb.text = [self.subReaderVM timeForRow];
                self.contentLb.text = [self.subReaderVM contentForRow];
                if (self.subReaderVM.docModel.img.count) {
                    [self.iconView.imageView setImageWithURL:[self.subReaderVM iconForRow]];
                    
                }
            //}
        }];
    }
}





- (SubReaderViewModel *)subReaderVM {
    if(_subReaderVM == nil) {
        _subReaderVM = [[SubReaderViewModel alloc] initWithDocId:self.docId];
        
    }
        return _subReaderVM;
}



- (UILabel *)titleLb {
	if(_titleLb == nil) {
		_titleLb = [[UILabel alloc] init];
        [self.scroll addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        _titleLb.font = [UIFont systemFontOfSize:22];
        _titleLb.numberOfLines = 0;
	}
	return _titleLb;
}

- (UILabel *)sourceLb {
	if(_sourceLb == nil) {
		_sourceLb = [[UILabel alloc] init];
        [self.scroll addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(15);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            
        }];
        _sourceLb.font = [UIFont systemFontOfSize:15];
        _sourceLb.textColor = [UIColor lightGrayColor];
	}
	return _sourceLb;
}

- (UILabel *)timeLb {
	if(_timeLb == nil) {
		_timeLb = [[UILabel alloc] init];
        [self.scroll addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.sourceLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.sourceLb.mas_topMargin);
        }];
        
        _timeLb.font = [UIFont systemFontOfSize:15];
        _timeLb.textColor = [UIColor lightGrayColor];
	}
	return _timeLb;
}

- (UILabel *)contentLb {
	if(_contentLb == nil) {
		_contentLb = [[UILabel alloc] init];
        [self.scroll addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.timeLb.mas_bottom).mas_equalTo(15);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        _contentLb.font = [UIFont systemFontOfSize:18];
        _contentLb.numberOfLines = 0;
	}
	return _contentLb;
}

//- (TRImageView *)iconView {
//	if(_iconView == nil) {
//		_iconView = [[TRImageView alloc] init];
//        [self.scroll addSubview:_iconView];
//        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.contentLb.mas_bottom).mas_equalTo(10);
//            make.left.mas_equalTo(10);
//            make.right.mas_equalTo(-10);
//            make.height.mas_equalTo(200);
//        }];
//	}
//	return _iconView;
//}

//- (UIView *)allView {
//	if(_allView == nil) {
//		_allView = [[UIView alloc] init];
//    }
//	return _allView;
//}

- (UIScrollView *)scroll {
	if(_scroll == nil) {
		_scroll = [[UIScrollView alloc] init];
        [self.view addSubview:_scroll];
        
       // [_scroll mas_makeConstraints:^(MASConstraintMaker *make) {
         //   make.height.mas_equalTo(200);
           // make.top.left.right.mas_equalTo(0);
            
        //}];
        _scroll.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
        _scroll.contentSize = CGSizeMake(self.view.bounds.size.width, 200);
        //_scroll.frame = self.view.frame;
        //_scroll.userInteractionEnabled = YES;
        //_scroll.showsVerticalScrollIndicator = YES;
    }
	return _scroll;
}



@end
