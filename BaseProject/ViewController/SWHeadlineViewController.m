//
//  SWHeadlineViewController.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/30.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "SWHeadlineViewController.h"
#import "SWHeadlineCell.h"
#import "SWHeadlineViewModel.h"
#import "SWHtmlViewController.h"

@interface SWHeadlineViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SWHeadlineViewModel *headlineVM;

@end

@implementation SWHeadlineViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[SWHeadlineCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.headlineVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showAlert:error.localizedDescription];
                } else {
                    [_tableView reloadData];
                }
                [_tableView.mj_header endRefreshing];
            }];
        }];
    }
    return _tableView;
}

- (SWHeadlineViewModel *)headlineVM {
    if (!_headlineVM) {
        _headlineVM = [SWHeadlineViewModel new];
    }
    return _headlineVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView beginHeaderRefresh];
}

#pragma mark --- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.headlineVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWHeadlineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.newsImageView.imageView setImageWithURL:[self.headlineVM imgsrcURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.titleLabel.text = [self.headlineVM titleForRow:indexPath.row];
    cell.createtimeLabel.text = [self.headlineVM createTimeForRow:indexPath.row];
    cell.commentNumberLabel.text = [self.headlineVM commentNumberForRow:indexPath.row];
    cell.commentImageView.imageView.image = [UIImage imageNamed:@"comment"];
    return cell;
}

#pragma mark --- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SWHtmlViewController *htmlVC = [[SWHtmlViewController alloc] initWithURL:[self.headlineVM url3wForRow:indexPath.row]];
    [self presentViewController:htmlVC animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
