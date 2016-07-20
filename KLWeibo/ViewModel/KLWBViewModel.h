//
//  KLWBViewModel.h
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <ReactiveCocoa.h>
#import <LinqToObjectiveC.h>
#import <WeiboSDK.h>
#import <MagicalRecord/MagicalRecord.h>
#import <MagicalRecord/MagicalRecord+ShorthandMethods.h>


@interface KLWBViewModel : NSObject


@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) RACCommand *fetchLocalCommand;

@property (nonatomic,strong) RACCommand *fetchRemoteCommand;


- (void)initialize;

@end
