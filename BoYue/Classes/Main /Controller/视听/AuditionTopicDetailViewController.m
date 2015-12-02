//
//  AuditionTopicDetailViewController.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicDetailViewController.h"
#import "AuditionTopicDetailViewModel.h"
#import "AuditionTopicDetailCell.h"

@interface AuditionTopicDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) AuditionTopicDetailViewModel *detailVM;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation AuditionTopicDetailViewController


- (instancetype)initWithTid:(NSString *)tid
{
    self = [super init];
    if (self) {
        _tid = tid;
    }
    return self;
}

- (AuditionTopicDetailViewModel *)detailVM {
    if(_detailVM == nil) {
        _detailVM = [[AuditionTopicDetailViewModel alloc] initWithTid:_tid];
    }
    return _detailVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    
// 添加顶部播放视图
        UIView *view = [self addHeadView];
        
// 添加到控制器
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.top.mas_equalTo(view.mas_bottom).mas_equalTo(0);
        }];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.detailVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.header endRefreshing];
            }];
        }];
        
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [_tableView reloadData];
            [_tableView.footer endRefreshing];
        }];
        
// 注册cell
        [_tableView registerClass:[AuditionTopicDetailCell class] forCellReuseIdentifier:@"Cell"];
        
    }
    return _tableView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
// 调用头部刷新
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.detailVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AuditionTopicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.detailVM titleForRow:indexPath.row];
    cell.timeLb.text = [self.detailVM timeForRow:indexPath.row];
    
    return cell;
}

kRemoveCellSeparator
/** cell跟随自动布局 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - 添加上方视图
- (UIView *)addHeadView{
// 背景父视图
    UIView *headView = [UIView new];
//    headView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(250);
    }];
    
// UIImageView
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"audionews_play_bg"]];
    [headView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
// 转动歌手头像
    UIImageView *iconIV = [[UIImageView alloc] init];
    iconIV.backgroundColor = [UIColor yellowColor];
    iconIV.layer.cornerRadius = 135 * 0.5;
    iconIV.layer.borderColor = [UIColor grayColor].CGColor;
    iconIV.layer.borderWidth = 10;
    [headView addSubview:iconIV];
    [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(135, 135));
    }];

// 播放按钮
    UIButton *playBtn = [UIButton buttonWithType:0];
    [playBtn setImage:[UIImage imageNamed:@"audionews_play_button"] forState:UIControlStateNormal];
    [playBtn setImage:[UIImage imageNamed:@"audionews_pause_button"] forState:UIControlStateSelected];
    [headView addSubview:playBtn];
    [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [playBtn bk_addEventHandler:^(id sender) {
        NSLog(@"%s: 点击了播放按钮", __func__);
    } forControlEvents:UIControlEventTouchUpInside];
    
// 上一首 按钮
    UIButton *lastBtn = [UIButton buttonWithType:0];
    [lastBtn setImage:[UIImage imageNamed:@"audionews_previous_button"] forState:UIControlStateNormal];
    [headView addSubview:lastBtn];
    [lastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(iconIV.mas_left).mas_equalTo(-30);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
// 下一首 按钮
    UIButton *nextBtn = [UIButton buttonWithType:0];
    [nextBtn setImage:[UIImage imageNamed:@"audionews_next_button"] forState:UIControlStateNormal];
    [headView addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(iconIV.mas_right).mas_equalTo(30);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    return headView;
}


#pragma mark - 点击cell响应
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}



@end
