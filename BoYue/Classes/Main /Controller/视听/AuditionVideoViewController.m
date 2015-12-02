//
//  AuditionVideoViewController.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionVideoViewController.h"
#import "AuditionSidCell.h"
#import "AuditionVideoViewModel.h"
#import "AuditionTopicSetViewModel.h"
#import "VedioViewCell.h"
#import "topicSetTopViewCell.h"
#import "TopMainCell.h"
#import "AuditionSidViewController.h"
#import "AuditionTopicSetInMainViewController.h"
#import "AuditionDetailViewController.h"

@interface AuditionVideoViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) AuditionVideoViewModel *videoVM;
@property (nonatomic, strong) AuditionTopicSetViewModel *topicVM;

// 保存是否点击过的状态
@property (nonatomic, assign) BOOL haveClick;

// 保存当前选中的是视频还是电台页面
@property (nonatomic, assign) NSInteger currentSelectIndex;

@end

@implementation AuditionVideoViewController

- (AuditionTopicSetViewModel *)topicVM{
    if (!_topicVM) {
        _topicVM = [AuditionTopicSetViewModel new];
    }
    return _topicVM;
}

- (AuditionVideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM = [AuditionVideoViewModel new];
    }
    return _videoVM;
}

static NSString * const reuseIdentifierSid = @"Cell";
static NSString * const reuseIdentifierVideo = @"VideoCell";
static NSString * const reuseIdentifierTop = @"topCell";
static NSString * const reuseIdentifierTopMain = @"topMainCell";

#pragma mark - 设置流水布局 及  cell的大小
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
//    CGFloat width = [UIScreen mainScreen].bounds.size.width / 4;
//    layout.itemSize = CGSizeMake(width, width);

    // 设置每一行之间的间距
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 1;
    
    // 设置section之间的间隔
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 5, 0);
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [Factory addMenuItemToVC:self];
    // 开始默认进入视频，电台没有点击打开过
    _haveClick = NO;
    
    // 设置背景的颜色
    self.collectionView.backgroundColor = kRGBColor(226, 225, 225);
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"AuditionSidCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifierSid];
    [self.collectionView registerNib:[UINib nibWithNibName:@"VedioViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifierVideo];
    [self.collectionView registerNib:[UINib nibWithNibName:@"topicSetTopViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifierTop];
    [self.collectionView registerNib:[UINib nibWithNibName:@"TopMainCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifierTopMain];
    
    // 载入数据
    [self loadData];
    
    // 添加segmented
    [self addSegmented];
    
}
#pragma mark - 添加segmented
- (void)addSegmented{
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:@[@"视频", @"电台"]];
    segmented.frame = CGRectMake(0, 0, 200, 30);
    segmented.tintColor = kNaviTitleColor;
    
    // 默认开始时选中第一个： 视频
    segmented.selectedSegmentIndex = 0;
    // 添加到导航栏上
    self.navigationItem.titleView = segmented;
    [segmented bk_addEventHandler:^(UISegmentedControl *sender) {
        self.currentSelectIndex = sender.selectedSegmentIndex;
        // 刷新数据
        [self.collectionView reloadData];
        
#pragma mark - 选择电台和视频时，默认进入视频，点击电台加载数据，之后点击不重复加载
        if (self.currentSelectIndex == 1 && !self.haveClick) {
            self.haveClick = YES;
            // 调用头部刷新
            [self.collectionView.header beginRefreshing];
        }
        
    } forControlEvents:UIControlEventValueChanged];
}

#pragma mark - 载入数据
- (void)loadData{
    // 头部刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        if (self.currentSelectIndex == 0) { // 视频
            [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
                [self.collectionView reloadData];
                [self.collectionView.header endRefreshing];
            }];
            
        }else{  // 电台
            [self.topicVM getDataFromNetCompleteHandle:^(NSError *error) {
                [self.collectionView reloadData];
                [self.collectionView.header endRefreshing];
            }];
        }
    }];

    // 注意： 这句必须在头部刷新后实现，否则第一次不会知道调用
    // 调用头部刷新
    [self.collectionView.header beginRefreshing];
    
    // 下拉刷新
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
#warning 电台不需要下拉刷新  bug
        if (self.currentSelectIndex == 0) {  // 电台不需要下拉刷新
            [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
                [self.collectionView reloadData];
                [self.collectionView.footer endRefreshing];
            }];
        }
        
    }];
}

#pragma mark <UICollectionViewDataSource
// 设置section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
// 每个section中的item数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.currentSelectIndex == 0) { // 视频
        if (section == 0) {
            return [self.videoVM sidRowNumber];
        }
        return [self.videoVM rowNumber];
    }
    
    // 电台
    if (section == 0) {
        return 2;
    }
    return self.topicVM.rowNumber;
    
}

#pragma mark - cell内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.currentSelectIndex == 0) {// 选中视频
        /** 是头部的Sid*/
        if (indexPath.section == 0) {
            
            AuditionSidCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierSid forIndexPath:indexPath];
            
            cell.sidTitleLabel.text = [self.videoVM sidTitleWithRow:indexPath.row];
            [cell.imgsrcBtn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:[self.videoVM sidIconWithRow:indexPath.row]]];
            
            return cell;
        }
        
        /** 视频部分    */
        VedioViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierVideo forIndexPath:indexPath];
        cell.titleLabel.text = [self.videoVM titleWithRow:indexPath.row];
        cell.desLabel.text = [self.videoVM desWithRow:indexPath.row];
        [cell.durationBT setTitle:[self.videoVM lengthWithRow:indexPath.row] forState:UIControlStateNormal];
        [cell.playCountBT setTitle:[self.videoVM playCountWithRow:indexPath.row] forState:UIControlStateNormal];
        [cell.commentBT setTitle:[self.videoVM replyCountWithRow:indexPath.row] forState:UIControlStateNormal];
        cell.playIV.hidden = NO;
        cell.url = [NSURL URLWithString:[self.videoVM mp4UrlWithRow:indexPath.row]];
        [cell.iconBtn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:[self.videoVM coverWithRow:indexPath.row]]];
        
        return cell;

    }
    
    // 电台
    if (indexPath.section == 0) {
        topicSetTopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierTop forIndexPath:indexPath];
        if (indexPath.row == 0) {
            [cell.cnameBtn setTitle:@"我的下载" forState:UIControlStateNormal];
            [cell.cnameBtn setImage:[UIImage imageNamed:@"feedlist_ad_download"] forState:UIControlStateNormal];
        }else{
            [cell.cnameBtn setTitle:@"最近播放" forState:UIControlStateNormal];
            [cell.cnameBtn setImage:[UIImage imageNamed:@"night_video_list_cell_time"] forState:UIControlStateNormal];
        }
        
        return cell;
    }
    
    TopMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierTopMain forIndexPath:indexPath];
    
    [cell.cnameBtn setTitle:[self.topicVM cnameWithRow:indexPath.row] forState:UIControlStateNormal];
    cell.tnameLabel.text = [self.topicVM tnameWithRow:indexPath.row Index:0];
    cell.tnameLabel2.text = [self.topicVM tnameWithRow:indexPath.row Index:1];
    cell.tnameLabel3.text = [self.topicVM tnameWithRow:indexPath.row Index:2];
    
    cell.titleLabel.text = [self.topicVM titleWithRow:indexPath.row Index:0];
    cell.titleLabel2.text = [self.topicVM titleWithRow:indexPath.row Index:1];
    cell.titleLabel3.text = [self.topicVM titleWithRow:indexPath.row Index:2];

//    [cell.iconIV0 setBackgroundImage:[UIImage imageNamed:@"new_task_update_logo"] forState:UIControlStateNormal];
    [cell.iconIV0 setBackgroundImageForState:UIControlStateNormal withURL:[self.topicVM imgsrcsInListForRow:indexPath.row][0]];
    [cell.iconIV1 setBackgroundImageForState:UIControlStateNormal withURL:[self.topicVM imgsrcsInListForRow:indexPath.row][1]];
    [cell.iconIV2 setBackgroundImageForState:UIControlStateNormal withURL:[self.topicVM imgsrcsInListForRow:indexPath.row][2]];
    
    return cell;
    
}

#pragma mark <UICollectionViewDataSource>
// 设置cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat width = 0;
    if (self.currentSelectIndex == 0) { // 视频
        if (indexPath.section == 1) {
            width = [UIScreen mainScreen].bounds.size.width;
            return CGSizeMake(width, 300); // 设置固定高度
        }
        
        width = [UIScreen mainScreen].bounds.size.width / self.videoVM.sidRowNumber - 1;
        return CGSizeMake(width, width);
    }
    
// 电台
    if (indexPath.section == 0) {
        width = (kWindowW - 2)/ 2;
        CGFloat height = 50;
        
        return CGSizeMake(width, height);
    }
    
    return CGSizeMake(kWindowW, 240);
}

#pragma mark - 点击cell进入下一个按钮
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.currentSelectIndex == 0) { // 电视
        if (indexPath.section == 0) {   // Sid上的cell
            AuditionSidViewController *sidVC = [[AuditionSidViewController alloc] init];
            sidVC.type = indexPath.row;
            sidVC.title = [self.videoVM sidTitleWithRow:indexPath.row];
            [self.navigationController pushViewController:sidVC animated:YES];
            return;
        }
        
        AuditionDetailViewController *vc = [[AuditionDetailViewController alloc] initWithReplayId:[self.videoVM replayIdForRow:indexPath.row] mp4URL:[NSURL URLWithString:[self.videoVM mp4UrlWithRow:indexPath.row]]];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{  // 电台
        
        if (indexPath.section == 0) {
            [self showErrorMsg:@"电台点击还没实现"];
            return;
        }
        
        AuditionTopicSetInMainViewController *vc = [[AuditionTopicSetInMainViewController alloc] initWithCid:[self.topicVM cidForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

implementation_sharedStance(AuditionVideoViewController)

//+ (UINavigationController *)satndtance {
//    static UINavigationController *navi = nil;
//    static dispatch_once_t onceYoken;
//    dispatch_once(&onceYoken, ^{
//        AuditionVideoViewController *videoVC = [AuditionVideoViewController new];
//        navi = [[UINavigationController alloc]initWithRootViewController:videoVC];
//    
//    });
//    return navi;
//}

@end
