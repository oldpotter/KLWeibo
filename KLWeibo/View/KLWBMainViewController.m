//
//  KLWBMainViewController.m
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBMainViewController.h"
#import <Masonry.h>
#import <UIColor+BFPaperColors.h>

#pragma mark tab bar item
@interface KLWBTabBarItem : UIButton

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;
@end


@implementation KLWBTabBarItem

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image
{
    UIEdgeInsets insets = UIEdgeInsetsMake(1, 1, 1, 1);
    
    KLWBTabBarItem *item = [[KLWBTabBarItem alloc] init];
    item.backgroundColor = [UIColor yellowColor];
    
    //title
    UILabel *lblTitle = [[UILabel alloc] init];
    [item addSubview:lblTitle];
    [lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_greaterThanOrEqualTo(item).insets(insets);
        make.centerX.mas_equalTo(item.center.x);
    }];
    lblTitle.text = title;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    
    //image
    UIImageView *ivImage = [[UIImageView alloc] initWithImage:image];
    [item addSubview:ivImage];
    [ivImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lblTitle.mas_top).offset(-5);
        make.centerX.mas_equalTo(item.center.x);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];

    return item;
    
}

@end


@interface KLWBMainViewController ()

@end

@implementation KLWBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 5, 5, 5);
    
    //tab bar
    UIView *tabBar = [[UIView alloc] init];
    [self.view addSubview:tabBar];
    [tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.height.mas_equalTo(KLWScreenHeight/12);
    }];
    tabBar.backgroundColor = [UIColor paperColorTeal400];
    
    //plus button
    UIButton *buttonPlus = [[UIButton alloc] init];
    [tabBar addSubview:buttonPlus];
    [buttonPlus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(tabBar.center);
        make.top.bottom.mas_equalTo(tabBar).insets(insets);
        make.width.mas_equalTo(buttonPlus.mas_height);
    }];
    [buttonPlus setImage:[UIImage imageNamed:@"plus_128px_1201206_easyicon.net.png"] forState:UIControlStateNormal];
    
    //首页
    KLWBTabBarItem *home = [KLWBTabBarItem itemWithTitle:@"首页" image:[UIImage imageNamed:@"home_128.73142857143px_1201101_easyicon.net.png"]];
    [tabBar addSubview:home];
    [home mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(tabBar).insets(insets);
        make.width.mas_equalTo(home.mas_height);
        make.left.mas_equalTo(tabBar.mas_left).offset(KLWScreenWidth/10);
    }];
    
    //消息
    KLWBTabBarItem *message = [KLWBTabBarItem itemWithTitle:@"消息" image:[UIImage imageNamed:@"text_message_128px_1187408_easyicon.net.png"]];
    [tabBar addSubview:message];
    [message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(tabBar).insets(insets);
        make.width.mas_equalTo(message.mas_height);
        make.left.mas_equalTo(home.mas_right).offset(20);
    }];
    
    //发现
    KLWBTabBarItem *look = [KLWBTabBarItem itemWithTitle:@"发现" image:[UIImage imageNamed:@"Look_search_128px_1082487_easyicon.net.png"]];
    [tabBar addSubview:look];
    [look mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(tabBar).insets(insets);
        make.width.mas_equalTo(message.mas_height);
        make.left.mas_equalTo(buttonPlus.mas_right).offset(20);
    }];
    
    //我
    KLWBTabBarItem *me = [KLWBTabBarItem itemWithTitle:@"我" image:[UIImage imageNamed:@"profile_128px_1185671_easyicon.net.png"]];
    [tabBar addSubview:me];
    [me mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(tabBar).insets(insets);
        make.width.mas_equalTo(message.mas_height);
        make.left.mas_equalTo(look.mas_right).offset(20);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end




