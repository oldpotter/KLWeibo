//
//  AppDelegate.m
//  KLWeibo
//
//  Created by Tom on 16/7/15.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "AppDelegate.h"
#import <WeiboSDK/WeiboSDK.h>
#import "KLWBMainViewController.h"

@interface AppDelegate ()<WeiboSDKDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[KLWBMainViewController alloc] init];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    NSLog(@"收到request:%@",request);
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    NSLog(@"收到response:%@",response);
    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        WBAuthorizeResponse *authorizeResponse = (WBAuthorizeResponse *)response;
        NSLog(@"认证结果：userID:%@,\n acessToken:%@,过期时间%@,刷新token%@",authorizeResponse.userID,authorizeResponse.accessToken,authorizeResponse.expirationDate,authorizeResponse.refreshToken);
        [[NSUserDefaults standardUserDefaults] setValue:authorizeResponse.accessToken forKey:KLWAccessToken];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

@end
