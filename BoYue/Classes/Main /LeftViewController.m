//
//  LeftViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
//#import <NSString+Icons.h>
//#import "RankListViewController.h"
#import "TuWanViewController.h"
#import "DRLoginViewController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *itemNames;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLb;
@property (nonatomic, strong) UIView *lineVe;
@property (nonatomic, strong) NSArray *imageNameArr;
@property (nonatomic)BOOL flag;
@end
@implementation LeftViewController

//comment_profile_default_hd个人  action_love收藏  audionews_indexheader_recent 历史
- (NSArray *)itemNames{
    return @[@"收       藏", @"历史记录", @"个人信息",@"",@"登       陆"];
}

- (NSArray *)imageNameArr {
    return @[@"action_love",@"audionews_playlist_duration",@"comment_profile_default_hd",@"",@""];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView=[UIView new];
        [self.view addSubview:_tableView];
        _tableView.rowHeight = 30;
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 180));
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(25);
            make.left.mas_equalTo(30);
            
        }];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    if (indexPath.row == 3) {
        
        [cell.contentView addSubview:self.lineVe];
        [self.lineVe mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.height.mas_equalTo(1);
        }];
        
        cell.accessoryView = [UIView new];//
    }
    cell.imageView.image = [UIImage imageNamed:self.imageNameArr[indexPath.row]];
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    self.flag = false;
    if (indexPath.row == 4) {
        cell.imageView.image = [UIImage imageNamed:@"audionews_indexheader_recent"];
        cell.textLabel.textColor = kRGBColor(62, 179, 249);
        if (self.flag) {
            cell.textLabel.text = @"退       出";
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
#warning 待完成代码段
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:{
            
            [self.sideMenuViewController setContentViewController:kVCFromSb(@"loginId", @"login")];
            [self.sideMenuViewController hideMenuViewController];
            break;
        }
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//必须触发一下tableView的懒加载才可以
    [self.tableView reloadData];
    myLog(@"UserName:%@",[DRUserInfo sharedDRUserInfo].userName);
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"skyBack"]];
    
}


- (UIImageView *)imageView {
	if(_imageView == nil) {
		_imageView = [[UIImageView alloc] init];
        [self.view addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.left.mas_equalTo(70);
            make.top.mas_equalTo(100);
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.centerX.mas_lessThanOrEqualTo(self.tableView.mas_centerX).with.offset(-24);
        }];
        _imageView.image = [UIImage imageNamed:@"login_username_icon"];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = 25;
        
	}
	return _imageView;
}

- (UILabel *)nameLb {
	if(_nameLb == nil) {
		_nameLb = [[UILabel alloc] init];
        [self.view addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(8);
            make.centerX.mas_equalTo(self.imageView.mas_centerX);
        }];
        _nameLb.textColor = [UIColor whiteColor];
        //_nameLb.text = @"1232142";
	}
	return _nameLb;
}



- (UIView *)lineVe {
	if(_lineVe == nil) {
		_lineVe = [[UIView alloc] init];
        
        _lineVe.backgroundColor = [UIColor lightGrayColor];
	}
	return _lineVe;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([DRUserInfo sharedDRUserInfo].userName) {
    //[self.tableView reloadData];
        self.flag = true;
        self.nameLb.text = [DRUserInfo sharedDRUserInfo].userName;
    }
}

@end
