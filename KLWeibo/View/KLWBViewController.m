//
//  KLWBViewController.m
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBViewController.h"

@interface KLWBViewController ()

@property (nonatomic,strong) KLWBViewModel *viewModel;

@end

@implementation KLWBViewController

- (instancetype)initWithViewModel:(id)viewModel
{
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self prepareUI];
    
    [self bindViewModel];
    
    [self.viewModel.fetchRemoteCommand execute:nil];
}

- (void)prepareUI{}

- (void)bindViewModel
{
    @weakify(self)
    
    RAC(self , title) = [RACObserve(self, viewModel.title) deliverOnMainThread];
    
    //app 进入进入前台时刷新
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationWillEnterForegroundNotification object:nil] takeUntil:[self rac_willDeallocSignal]] subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel.fetchRemoteCommand execute:nil];
    }];
    
}



@end
