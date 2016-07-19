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
@interface KLWBViewModel : NSObject


@property (nonatomic,copy) NSString *title;


@property (nonatomic,strong) RACCommand *fetchRemoteCommand;


- (void)initialize;

@end
