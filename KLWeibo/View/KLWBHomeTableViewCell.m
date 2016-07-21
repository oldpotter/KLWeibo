//
//  KLWBHomeTableViewCell.m
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBHomeTableViewCell.h"
#define useContainer 0

@interface KLWBHomeTableViewCell()
/**
 *  用户头像
 */
@property (nonatomic,strong) UIImageView *ivAvatar;
/**
 *  用户昵称
 */
@property (nonatomic,strong) UILabel *lblUserName;

@property (nonatomic,strong) UILabel *lblContent;

@property (nonatomic,strong) UILabel *lblDate;

@property (nonatomic,strong) UIImageView *ivImage;

@property (nonatomic,strong) UIImageView *ivImage1;
@property (nonatomic,strong) UIImageView *ivImage2;
@property (nonatomic,strong) UIImageView *ivImage3;
@property (nonatomic,strong) UIImageView *ivImage4;
@property (nonatomic,strong) UIImageView *ivImage5;
@property (nonatomic,strong) UIImageView *ivImage6;
@property (nonatomic,strong) UIImageView *ivImage7;
@property (nonatomic,strong) UIImageView *ivImage8;
@property (nonatomic,strong) UIImageView *ivImage9;
@property (nonatomic,strong) NSArray *ivImageArray;


@end

@implementation KLWBHomeTableViewCell
@synthesize viewModel;
- (void)prepareUI
{
    [super prepareUI];
    
    //头像
    self.ivAvatar = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivAvatar];
    [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).insets(kInsetsMultiple(2));
    }];
    [self.ivAvatar setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    //用户名
    self.lblUserName = [[UILabel alloc] init];
    [self.contentView addSubview:self.lblUserName];
    [self.lblUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.ivAvatar.mas_top);
        make.left.mas_equalTo(self.ivAvatar.mas_right).offset(kPadding);
    }];
    self.lblUserName.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    
    
    //内容
    self.lblContent = [[UILabel alloc] init];
    [self.contentView addSubview:self.lblContent];
    [self.lblContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView).insets(kInsetsMultiple(2));
        make.top.mas_equalTo(self.ivAvatar.mas_bottom).offset(kPadding);
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
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(- kPadding * 2);
    }];
    

    //图片组
    self.ivImage1 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage1];
    self.ivImage2 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage2];
    self.ivImage3 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage3];
    self.ivImage4 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage4];
    self.ivImage5 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage5];
    self.ivImage6 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage6];
    self.ivImage7 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage7];
    self.ivImage8 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage8];
    self.ivImage9 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.ivImage9];
    
    [[RACObserve(self, viewModel) deliverOnMainThread] subscribeNext:^(id x) {
        
        
        //ivImage1
        [self.ivImage1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 1) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.left.mas_equalTo(self.ivImage.mas_left);
            make.top.mas_equalTo(self.ivImage.mas_bottom).offset(kPadding);
        }];
        
        //ivImage2
        [self.ivImage2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 1) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage1.mas_top);
            make.left.mas_equalTo(self.ivImage1.mas_right);
        }];
        
        //ivImage3
        [self.ivImage3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 2) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage1.mas_top);
//            make.right.mas_equalTo(self.imageArrayContainer);
            make.left.mas_equalTo(self.ivImage2.mas_right);
        }];
        
        //ivImage4
        [self.ivImage4 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 3) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage1.mas_bottom);
            make.left.mas_equalTo(self.ivImage1.mas_left);
        }];
        
        //ivImage5
        [self.ivImage5 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 4) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage4.mas_top);
            make.left.mas_equalTo(self.ivImage4.mas_right);
        }];
        
        //ivImage6
        [self.ivImage6 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 5) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage4.mas_top);
            make.left.mas_equalTo(self.ivImage5.mas_right);
        }];
        
        //ivImage7
        [self.ivImage7 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 6) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage4.mas_bottom);
            make.left.mas_equalTo(self.ivImage1.mas_left);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(- kPadding * 2);
        }];
        
        //ivImage8
        [self.ivImage8 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 7) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage7.mas_top);
            make.left.mas_equalTo(self.ivImage7.mas_right);
        }];
        
        //ivImage9
        [self.ivImage9 mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.viewModel.picURLs.count > 8) {
                make.width.mas_equalTo(self.lblContent.mas_width).dividedBy(3);
                make.height.mas_equalTo(self.ivImage1.mas_width);
            }else{
                make.size.mas_equalTo(CGSizeZero);
            }
            make.top.mas_equalTo(self.ivImage7.mas_top);
            make.left.mas_equalTo(self.ivImage8.mas_right);
            
        }];
    }];
    
    MASAttachKeys(
                  self.ivAvatar,
                  self.lblContent,
                  self.lblDate,
                  self.lblUserName,
                  self.ivImage,
                  self.ivImage1,
                  self.ivImage2,
                  self.ivImage3,
                  self.ivImage4,
                  self.ivImage5,
                  self.ivImage6,
                  self.ivImage7,
                  self.ivImage8,
                  self.ivImage9
                  )
    
    
    
    
    self.ivImageArray = @[
                          self.ivImage1,
                          self.ivImage2,
                          self.ivImage3,
                          self.ivImage4,
                          self.ivImage5,
                          self.ivImage6,
                          self.ivImage7,
                          self.ivImage8,
                          self.ivImage9
                          ];
    
    
 
     
}

- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self)
    
    [[RACObserve(self, viewModel.model) deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        if (self.viewModel.model.user.profile_image_url) {
            [self.ivAvatar sd_setImageWithURL:[NSURL URLWithString:self.viewModel.model.user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_holder.png"]];
        }else{
            self.ivAvatar.image = nil;
        }
    }];
    RAC(self.lblUserName , text) = [RACObserve(self, viewModel.model.user.screen_name) deliverOnMainThread];
    RAC(self.lblContent , text) = [RACObserve(self, viewModel.model.text) deliverOnMainThread];
    RAC(self.lblDate , text) = [RACObserve(self, viewModel.model.date) deliverOnMainThread];
    
    [[RACObserve(self, viewModel.model) deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        if (self.viewModel.picURLs.count > 1) {
            self.ivImage.image = nil;
            NSLog(@"有%ld个的子链接",self.viewModel.picURLs.count);
           [self.viewModel.picURLs enumerateObjectsUsingBlock:^(NSString *url, NSUInteger idx, BOOL * _Nonnull stop) {
               [self.ivImageArray[idx] sd_setImageWithURL:[NSURL URLWithString:self.viewModel.picURLs[idx]] placeholderImage:[UIImage imageNamed:@"20160720015706672_easyicon_net_512.ico"]];
           }];
            
        }else if(self.viewModel.model.thumbnail_pic){
            [self.ivImageArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
                imageView.image = nil;
            }];
             NSLog(@"没有子链接,但有缩略图:%@",self.viewModel.model.thumbnail_pic);
            [self.ivImage sd_setImageWithURL:[NSURL URLWithString:self.viewModel.model.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"20160720015706672_easyicon_net_512.ico"]];
        }else{
            self.ivImage.image = nil;
            [self.ivImageArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
                imageView.image = nil;
            }];

        }
        
//        if(self.viewModel.model.thumbnail_pic){
//            NSLog(@"没有子链接,但有缩略图:%@",self.viewModel.model.thumbnail_pic);
//            [self.ivImage sd_setImageWithURL:[NSURL URLWithString:self.viewModel.model.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"20160720015706672_easyicon_net_512.ico"]];
//        }else{
//            self.ivImage.image = nil;
//        }
    }];
    

}




@end
