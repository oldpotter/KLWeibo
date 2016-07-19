//
//  KLWBTableViewController.h
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBViewController.h"


#define kCellId @"kCellId"

@interface KLWBTableViewController : KLWBViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end
