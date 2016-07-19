//
//  KLWBHomeViewModel.m
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBHomeViewModel.h"
#import <AFNetworking.h>
#import "KLWBWeiboModel.h"
#import <MTLJSONAdapter.h>
#import <WeiboSDK.h>
#import "KLWBHomeTableViewCellViewModel.h"
#import <LinqToObjectiveC.h>


@implementation KLWBHomeViewModel

- (void)initialize
{
    self.title = @"主页";
    
    
    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:KLWAccessToken];
    if(!token)
    {
        NSLog(@"没有token");
        return;
    }
    
    self.fetchRemoteCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSDictionary *info = @{
                                   @"access_token" : token,
                                   @"count" : @50
                                   };
            [manager GET:@"https://api.weibo.com/2/statuses/public_timeline.json" parameters:info progress:^(NSProgress * _Nonnull downloadProgress) {
                [subscriber sendNext:nil];
                NSLog(@"progress:%@",downloadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *info = (NSDictionary *)responseObject;
                NSArray *weibos = info[@"statuses"];
                
                self.dataSource = @[[weibos linq_select:^id(NSDictionary *weibo) {
                    KLWBWeiboModel *weiboModel = [MTLJSONAdapter modelOfClass:KLWBWeiboModel.class fromJSONDictionary:weibo error:nil];
                    KLWBHomeTableViewCellViewModel *cellVM = [[KLWBHomeTableViewCellViewModel alloc] initWithModel:weiboModel];
                    return cellVM;
                }]];
                
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"有错误 :%@",error);
                [subscriber sendError:nil];
            }];
            
//            [manager POST:@"https://api.weibo.com/oauth2/get_token_info" parameters:@{@"access_token" : token} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//                NSLog(@"form data:%@",formData);
//            } progress:^(NSProgress * _Nonnull uploadProgress) {
//                NSLog(@"upload progress:%@",uploadProgress);
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                NSLog(@"success:%@",responseObject);
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                NSLog(@"error:%@",error);
//            }];
            
//            WBAuthorizeRequest *request = [WBAuthorizeRequest request];
//            request.redirectURI = kRedirectURI;
//            request.scope = @"all";
//            request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
//                                 @"Other_Info_1": [NSNumber numberWithInt:123],
//                                 @"Other_Info_2": @[@"obj1", @"obj2"],
//                                 @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
//            [WeiboSDK sendRequest:request];
            
            return nil;
        }];
    }];
    
    
}

@end
