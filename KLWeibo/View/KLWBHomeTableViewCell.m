//
//  KLWBHomeTableViewCell.m
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBHomeTableViewCell.h"


@interface KLWBHomeTableViewCell()

@property (nonatomic,strong) UILabel *lblContent;

@property (nonatomic,strong) UILabel *lblDate;



@end

@implementation KLWBHomeTableViewCell
@synthesize viewModel;
- (void)prepareUI
{
    [super prepareUI];
    
    self.lblContent = [[UILabel alloc] init];
    [self.contentView addSubview:self.lblContent];
    [self.lblContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView).insets(kInsetsMultiple(2));
    }];
    self.lblContent.numberOfLines = 0;
    
    self.lblDate = [[UILabel alloc] init];
    [self.contentView addSubview:self.lblDate];
    [self.lblDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.contentView).insets(kInsetsMultiple(2));
        make.top.mas_equalTo(self.lblContent.mas_bottom).offset(kPadding);
    }];
    
}

- (void)bindViewModel
{
    [super bindViewModel];
    
    RAC(self.lblContent , text) = [RACObserve(self, viewModel.model.text) deliverOnMainThread];
//    RAC(self.lblDate , text) = [RACObserve(self, viewModel.model.date) deliverOnMainThread];
    self.lblDate.text = @"12312312312312";
}

@end
