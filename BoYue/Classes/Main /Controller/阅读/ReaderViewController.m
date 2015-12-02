//
//  ReaderViewController.m
//  BoYue
//
//  Created by drouce on 15/11/25.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "ReaderViewController.h"
#import "ReaderViewModel.h"
#import "ReaderViewCell.h"
#import "SubReaderViewController.h"
#import "TuWanHtmlViewController.h"

@interface ReaderViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ReaderViewModel *readVM;

@end

@implementation ReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"阅读";
    self.view.backgroundColor = kRGBColor(235, 235, 236);
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
}

implementation_sharedStance(ReaderViewController)


- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 120;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(0);
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(-30);
        }];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.readVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    myLog(@"%@",error.localizedDescription);
                } else {
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        
        [_tableView registerClass:[ReaderViewCell class] forCellReuseIdentifier:@"readCell"];
	}
	return _tableView;
}

- (ReaderViewModel *)readVM {
	if(_readVM == nil) {
		_readVM = [[ReaderViewModel alloc] init];
	}
	return _readVM;
}


#pragma mark - tableView协议方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.readVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReaderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"readCell"];
    [cell.iconIV.imageView setImageWithURL:[self.readVM iconForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLB.text = [self.readVM titleForRow:indexPath.section];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    SubReaderViewController *html = [[SubReaderViewController alloc]initWithDocId:[self.readVM docIdForRow:indexPath.section]];

    [html.subReaderVM getDataFromNetCompleteHandle:^(NSError *error) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[html.subReaderVM sourceURLForRow]];
        if ([html.subReaderVM sourceURLForRow]) {
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            [self.navigationController pushViewController:html animated:YES];
        }
        
    }];
    
    
}


@end
