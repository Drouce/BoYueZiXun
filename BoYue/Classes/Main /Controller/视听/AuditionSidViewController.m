//
//  AuditionSidViewController.m
//  BaseProject
//
//  Created by yang_0921 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AuditionSidViewController.h"
#import "AuditionVideoSidViewModel.h"
#import "VedioViewCell.h"
#import "AuditionDetailViewController.h"
@interface AuditionSidViewController ()

@property (nonatomic, strong) AuditionVideoSidViewModel *sidVM;

@end

@implementation AuditionSidViewController

- (AuditionVideoSidViewModel *)sidVM {
    if(_sidVM == nil) {
        _sidVM = [[AuditionVideoSidViewModel alloc] initAuditionVideoSidWithType:self.type];
    }
    return _sidVM;
}

static NSString * const reuseIdentifierVideo = @"VideoCell";

#pragma mark - 设置流水布局 及  cell的大小
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    //    CGFloat width = [UIScreen mainScreen].bounds.size.width / 4;
    //    layout.itemSize = CGSizeMake(width, width);
    
    // 设置每一行之间的间距
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 1;
    
    // 设置section之间的间隔
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0);
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory addBackItemToVC:self];
    
// 设置背景颜色
    self.collectionView.backgroundColor = kRGBColor(226, 225, 225);
    
    
// 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"VedioViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifierVideo];
    
// 加载数据
    [self loadData];
    
}


#pragma mark - 载入数据
- (void)loadData{
    // 头部刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.sidVM refreshDataCompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.header endRefreshing];
        }];
        
    }];
    
    // 注意： 这句必须在头部刷新后实现，否则第一次不会知道调用
    // 调用头部刷新
    [self.collectionView.header beginRefreshing];
    
    // 下拉刷新
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.sidVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.header endRefreshing];
        }];
    }];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%ld", self.sidVM.rowNumber);
    return [self.sidVM rowNumber];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VedioViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierVideo forIndexPath:indexPath];
    
    cell.titleLabel.text = [self.sidVM titleWithRow:indexPath.row];
    cell.desLabel.text = [self.sidVM descriptionWithRow:indexPath.row];
    [cell.iconBtn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:[self.sidVM coverWithRow:indexPath.row]]];
    cell.url = [self.sidVM mp4UrlWithRow:indexPath.row];
    [cell.durationBT setTitle:[self.sidVM lengthWithRow:indexPath.row] forState:UIControlStateNormal];
    [cell.playCountBT setTitle:[self.sidVM playCountWithRow:indexPath.row] forState:UIControlStateNormal];
    [cell.commentBT setTitle:[self.sidVM replyCountWithRow:indexPath.row] forState:UIControlStateNormal];
    cell.playIV.hidden = NO;
    
    return cell;
}

// 设置cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width, 300); // 设置固定高度

}

#pragma mark - 点击进入
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AuditionDetailViewController *vc = [[AuditionDetailViewController alloc] initWithReplayId:[self.sidVM replayIdForRow:indexPath.row] mp4URL:[self.sidVM mp4UrlWithRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
