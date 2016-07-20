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

@property (nonatomic,strong) UIImageView *ivImage;

@end

@implementation KLWBHomeTableViewCell
@synthesize viewModel;
- (void)prepareUI
{
    [super prepareUI];
    //内容
    self.lblContent = [[UILabel alloc] init];
    [self.contentView addSubview:self.lblContent];
    [self.lblContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView).insets(kInsetsMultiple(2));
    }];
    self.lblContent.numberOfLines = 0;
    
    //日期
    self.lblDate = [[UILabel alloc] init];
    [self.contentView addSubview:self.lblDate];
    [self.lblDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView).insets(kInsetsMultiple(2));
        make.top.mas_equalTo(self.lblContent.mas_bottom).offset(kPadding);
    }];
    
    //图片
    self.ivImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage];
    [self.ivImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lblDate.mas_bottom).offset(kPadding);
        make.left.mas_equalTo(self.contentView.mas_left).offset(kPadding * 2);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(- kPadding * 2);
    }];
    
}

- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self)
    
    RAC(self.lblContent , text) = [RACObserve(self, viewModel.model.text) deliverOnMainThread];
    RAC(self.lblDate , text) = [RACObserve(self, viewModel.model.date) deliverOnMainThread];
    [[RACObserve(self, viewModel.model) deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        NSString *strURL = self.viewModel.model.thumbnail_pic;
        if (strURL && ![strURL isEqualToString:@""]) {
            [self.ivImage sd_setImageWithURL:[NSURL URLWithString:self.viewModel.model.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"20160720015706672_easyicon_net_512.ico"]];
        }else{
            self.ivImage.image = nil;
        }
    }];
}


@end
