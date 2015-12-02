//
//  AuditionTopicSetInViewController.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionTopicSetInMainViewController.h"
#import "AuditionTopicSetInMainViewModel.h"
#import "AuditionDianTaiInMainCell.h"
#import "PlayMusicView.h"
#import "AuditionTopicDetailViewController.h"

@interface AuditionTopicSetInMainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) AuditionTopicSetInMainViewModel *maimVM;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation AuditionTopicSetInMainViewController

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _tableView;
}

- (AuditionTopicSetInMainViewModel *)maimVM {
    if(_maimVM == nil) {
        _maimVM = [[AuditionTopicSetInMainViewModel alloc] initWithCid:self.cid];
    }
    return _maimVM;
}

- (instancetype)initWithCid:(NSString *)cid
{
    self = [super init];
    if (self) {
        self.cid = cid;
    }
    return self;
}
/** 防御性操作 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert1(NO, @"%s: 必须使用initWithCid方法初始化", __func__);
    }
    return self;
}



static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    [self.tableView registerClass:[AuditionDianTaiInMainCell class] forCellReuseIdentifier:reuseIdentifier];
    
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.maimVM refreshDataCompletionHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:@"没有数据"];
           }else{
               [self.tableView reloadData];
           }
           [self.tableView.header endRefreshing];
       }];
    }];
    
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        [self.maimVM getMoreDataCompletionHandle:^(NSError *error) {
//            if (error) {
//                [self showErrorMsg:@"没有更多数据了"];
//            }else{
//                [self.tableView reloadData];
//            }
//            [self.tableView.mj_footer endRefreshing];
//        }];
//    }];
    [self.tableView.header beginRefreshing];
    
    
// 设置 cell 的高度
    self.tableView.rowHeight = 90;
    
#pragma mark - 添加播放控制视图
    [self.view addSubview:[PlayMusicView sharedInstance]];
    [[PlayMusicView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-70);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.maimVM.rowNumber;
}

// 取消cell 间隙
kRemoveCellSeparator
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AuditionDianTaiInMainCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    [cell.iconIV.imageView setImageWithURL:[self.maimVM iconForRow:indexPath.row]];
    cell.titleLB.text = [self.maimVM titleForRow:indexPath.row];
    cell.desLB.text = [self.maimVM desForRow:indexPath.row];
    [cell.clickBT setTitle:[self.maimVM clickNumberForRow:indexPath.row] forState:UIControlStateNormal];
    
    return cell;
}


#pragma mark - 点击cell响应
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *path = @"http://fdfs.xmcdn.com/group16/M04/9A/C4/wKgDalZDY9_wpRVbAA7kXvFUWFY922.mp3";
    
    
//    [[PlayMusicView sharedInstance] playWithURL:[NSURL URLWithString:path]];
    
    AuditionTopicDetailViewController *vc = [[AuditionTopicDetailViewController alloc] initWithTid:[self.maimVM tidForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}



@end
