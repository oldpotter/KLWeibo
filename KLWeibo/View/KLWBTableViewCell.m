//
//  KLWBTableViewCell.m
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBTableViewCell.h"
@interface KLWBTableViewCell()

@end


@implementation KLWBTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareUI];
        [self bindViewModel];
    }
    return self;
}

- (void)prepareUI{}

- (void)bindViewModel{}

- (void)setCellViewModel:(id)viewModel
{
    self.viewModel = viewModel;
}
@end
