//
//  KLWBHomeViewModel.m
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBHomeViewModel.h"
#import "KLWBHomeTableViewCellViewModel.h"
#import "KLWBWeibo.h"


@implementation KLWBHomeViewModel
@synthesize fetchRemoteCommand = _fetchRemoteCommand,fetchLocalCommand = _fetchLocalCommand;
- (void)initialize
{
    [super initialize];
    self.title = @"公共微博";
}


- (RACCommand *)fetchLocalCommand
{
    @weakify(self)
    if (!_fetchLocalCommand) {
        _fetchLocalCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self)
            NSArray *weibos = [KLWBWeibo MR_findAll];
            self.dataSource = @[[weibos linq_select:^id(KLWBWeibo *weibo) {
                KLWBHomeTableViewCellViewModel *cellVM = [[KLWBHomeTableViewCellViewModel alloc] initWithModel:weibo];
                return cellVM;
            }]];
            return [RACSignal empty];
        }];
    }
    return _fetchLocalCommand;
}

- (RACCommand *)fetchRemoteCommand
{
    @weakify(self)
    if (!_fetchRemoteCommand) {
        _fetchRemoteCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:KLWBAccessToken];
            if (!token) {
                return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                    [subscriber sendError:[NSError errorWithDomain:KLWB_ERROR_NOLOGINUSER code:0 userInfo:nil]];
                    return nil;
                }];
            }
            
            
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
                    __block NSArray *weibos = [KLWBWeibo MR_importFromArray:info[@"statuses"]];
                    
//                    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
//                        [KLWBWeibo MR_importFromArray:weibos inContext:localContext];
//                    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
//                        NSLog(@"%@",contextDidSave ? @"保存成功" : @"保存失败");
//                    }];
                    
                    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError * _Nullable error) {
                        if (contextDidSave) {
                            NSLog(@"保存成功");
                        }else{
                            NSLog(@"保存出错:%@",error);
                        }
                    }];
                    @strongify(self)
                    self.dataSource = @[[weibos linq_select:^id(KLWBWeibo *weibo) {
                        return [[KLWBHomeTableViewCellViewModel alloc] initWithModel:weibo];
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
    
    return _fetchRemoteCommand;
}

@end
