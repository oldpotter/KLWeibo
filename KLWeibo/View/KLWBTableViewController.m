//
//  KLWBTableViewController.m
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBTableViewController.h"
#import "KLWBTableViewModel.h"
#import "KLWBTableViewCell.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface KLWBTableViewController ()

@property (nonatomic,strong) KLWBTableViewModel *viewModel;

@end

@implementation KLWBTableViewController
@synthesize viewModel;
- (void)prepareUI
{
    [super prepareUI];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.frame;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self)
    
    //data source变化时刷新table view
    [[[RACObserve(self, viewModel.dataSource) distinctUntilChanged] deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        [self.tableView reloadData];
    }];
//    [[[self.viewModel rac_signalForSelector:@selector(reloadTableView)] deliverOnMainThread] subscribeNext:^(id x) {
//        @strongify(self)
//        [self.tableView reloadData];
//    }];
}


#pragma mark table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KLWBTableViewModel *cellVM = self.viewModel.dataSource[indexPath.section][indexPath.row];
    KLWBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    [cell setCellViewModel:cellVM];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:kCellId cacheByIndexPath:indexPath configuration:^(id cell) {
        KLWBTableViewModel *cellVM = self.viewModel.dataSource[indexPath.section][indexPath.row];
        [cell setCellViewModel:cellVM];
    }];
}


- (UITableView *)tableView
{
    if (!_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
