//
//  Constant.h
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#import "AppDelegate.h"
#define KLWBAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

/*User Defaults*/
#define KLWBAccessToken @"KLWAccessToken"

/**
 UI
 */
#define KLWBScreenWidth [UIScreen mainScreen].bounds.size.width
#define KLWBScreenHeight [UIScreen mainScreen].bounds.size.height

/**
  ERROR
 */
//用户没有登录
#define KLWB_ERROR_NOLOGINUSER @"KLWB_ERROR_NOLOGINUSER"

/**
    Notification
 */
//用户认证成功
#define KLWB_DidAuthorizeNotification @"KLWB_DidAuthorizeNotification"

#endif /* Constant_h */
