//
//  KLWBViewModel.m
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBViewModel.h"

@implementation KLWBViewModel

- (instancetype)init
{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    @weakify(self)
    
    [self.fetchRemoteCommand.errors subscribeNext:^(NSError *error) {
        if ([error.domain isEqualToString:KLWB_ERROR_NOLOGINUSER]) {
            WBAuthorizeRequest *request = [WBAuthorizeRequest request];
            request.redirectURI = kRedirectURI;
            request.scope = @"all";
            request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                                 @"Other_Info_1": [NSNumber numberWithInt:123],
                                 @"Other_Info_2": @[@"obj1", @"obj2"],
                                 @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
            [WeiboSDK sendRequest:request];
        }
    }];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:KLWB_DidAuthorizeNotification object:nil] subscribeNext:^(id x) {
        if(KLWBDebug) NSLog(@"用户认证成功");
        @strongify(self)
        [self.fetchRemoteCommand execute:nil];
    }];
}

@end
