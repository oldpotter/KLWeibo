//
//  KLWBHomeViewController.m
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBHomeViewController.h"
#import "KLWBHomeTableViewCell.h"
@interface KLWBHomeViewController ()

@end

@implementation KLWBHomeViewController

- (void)prepareUI
{
    [super prepareUI];
    
    [self.tableView registerClass:[KLWBHomeTableViewCell class] forCellReuseIdentifier:kCellId];
}

@end
