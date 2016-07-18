//
//  ViewController.m
//  KLWeibo
//
//  Created by Tom on 16/7/15.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "ViewController.h"
#import <WeiboSDK/WeiboSDK.h>
#import <Masonry.h>
#import <ReactiveCocoa.h>
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    //登录
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:buttonLogin];
    [buttonLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointZero);
    }];
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [[buttonLogin rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        WBAuthorizeRequest *request = [WBAuthorizeRequest request];
        request.redirectURI = kRedirectURI;
        request.scope = @"all";
        request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                             @"Other_Info_1": [NSNumber numberWithInt:123],
                             @"Other_Info_2": @[@"obj1", @"obj2"],
                             @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
        [WeiboSDK sendRequest:request];
    }];
    
    //获取公共微博
    UIButton *buttonFetchPublicWeibo = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:buttonFetchPublicWeibo];
    [buttonFetchPublicWeibo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(buttonLogin);
        make.top.mas_equalTo(buttonLogin.mas_bottom).offset(10);
    }];
    [buttonFetchPublicWeibo setTitle:@"获取微博" forState:UIControlStateNormal];
    [[buttonFetchPublicWeibo rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:KLWAccessToken];
        if(!token)
        {
            NSLog(@"没有token");
            return;
        }
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSDictionary *info = @{
                               @"access_token" : token,
                               @"count" : @3
                               };
        [manager GET:@"https://api.weibo.com/2/statuses/public_timeline.json" parameters:info progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"progress:%@",downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *info = (NSDictionary *)responseObject;
            NSArray *weibos = info[@"statuses"];
            NSLog(@"%@",weibos);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error :%@",error);
        }];
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
