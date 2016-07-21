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
#import <MagicalRecord/MagicalRecord.h>
#import <ReactiveCocoa.h>

@interface AppDelegate ()<WeiboSDKDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    
    NSURL *homeURL = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
    NSLog(@"主目录:$%@",homeURL.path);
    //magic record
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreAtURL:[homeURL URLByAppendingPathComponent:@"klwb"]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[KLWBMainViewController alloc] init];
    
    [[self rac_signalForSelector:@selector(didReceiveWeiboRequest:) fromProtocol:@protocol(WeiboSDKDelegate)] subscribeNext:^(RACTuple *tuple) {
        WBBaseRequest *request = tuple.first;
        NSLog(@"收到request:%@",request);
    }];
    [[self rac_signalForSelector:@selector(didReceiveWeiboResponse:) fromProtocol:@protocol(WeiboSDKDelegate)] subscribeNext:^(RACTuple *tuple) {
        WBBaseResponse *response = tuple.first;
        NSLog(@"收到response:%@",response);
        if ([response isKindOfClass:WBAuthorizeResponse.class]) {
            WBAuthorizeResponse *authorizeResponse = (WBAuthorizeResponse *)response;
            NSLog(@"认证结果：userID:%@,\n acessToken:%@,过期时间%@,刷新token%@ , userInfo:%@",authorizeResponse.userID,authorizeResponse.accessToken,authorizeResponse.expirationDate,authorizeResponse.refreshToken,authorizeResponse.userInfo);
            [[NSUserDefaults standardUserDefaults] setValue:authorizeResponse.accessToken forKey:KLWBAccessToken];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSNotificationCenter defaultCenter] postNotificationName:KLWB_DidAuthorizeNotification object:nil];
        }
    }];
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    [MagicalRecord cleanUp];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}



@end
