//
//  AuditionDetailViewController.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionDetailViewController.h"
#import "AuditionDetailViewModel.h"
#import "AuditonDetailCell.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AuditionDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AuditionDetailViewModel *detailVM;

/** 顶部视图 */
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation AuditionDetailViewController

- (instancetype)initWithReplayId:(NSString *)replayId mp4URL:(NSURL *)url
{
    self = [super init];
    if (self) {
        self.replayId = replayId;
        self.url = url;
    }
    return self;
}

- (AuditionDetailViewModel *)detailVM {
    if(_detailVM == nil) {
        _detailVM = [[AuditionDetailViewModel alloc] initWithReplayId:_replayId];
    }
    return _detailVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
// 添加到视图
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
            make.left.bottom.right.mas_equalTo(0);
        }];
// 刷新数据
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.detailVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.header endRefreshing];
            }];
        }];
    }
// 注册cell
    [_tableView registerClass:[AuditonDetailCell class] forCellReuseIdentifier:@"Cell"];
    
// 去除多余cell
    _tableView.tableFooterView = [UIView new];
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
// 添加返回按钮
    [Factory addBackItemToVC:self];
// 隐藏导航栏
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
// 头部刷新
    [self.tableView.header beginRefreshing];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.detailVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AuditonDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.detailVM iconURLForRow:indexPath.row]];
    cell.nameLb.text = [self.detailVM nameForRow:indexPath.row];
    cell.sourceLb.text = [self.detailVM sourceForRow:indexPath.row];
    cell.clickGoodLb.text = [self.detailVM clickNumberForRow:indexPath.row];
    cell.commentLb.text = [self.detailVM commentForRow:indexPath.row];
    
    return cell;
}

kRemoveCellSeparator
//允许自动布局
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

/*************************** topView ************************/

//#import <AVFoundation/AVFoundation.h>
//#import <AVKit/AVKit.h>
//
//+ (AVPlayerViewController *)shareInstance{
//    static AVPlayerViewController *vc = nil;
//    static dispatch_once_t onceToken;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        <#code to be executed once#>
//    });
//}


// 单例模式：保证同一时间只有一个播放器
+ (AVPlayerViewController *)shareInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}


- (UIView *)topView{
    
    _topView = [UIView new];
    [self.view addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"video_content_bg"]];
    [_topView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIImageView *playIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"contentview_play"]];
    [imgV addSubview:playIV];
    [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    UIImageView *titleIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navbar_netease"]];
    titleIV.contentMode = 1;
    [imgV addSubview:titleIV];
    [titleIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(-40);
        make.size.mas_equalTo(CGSizeMake(80, 60));
    }];
    
    UIButton *playBtn = [UIButton buttonWithType:0];
    [_topView addSubview:playBtn];
    [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [playBtn bk_addEventHandler:^(id sender) {
        
        AVPlayer *player = [AVPlayer playerWithURL:self.url];
        [player play];
        self.player = player;
        [AuditionDetailViewController shareInstance].player = player;
        [sender addSubview:[AuditionDetailViewController shareInstance].view];
        [[AuditionDetailViewController shareInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {

            make.edges.mas_equalTo(0);
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    return _topView;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_player pause];
}

@end
