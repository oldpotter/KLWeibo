//
//  KLWBViewController.h
//  KLWeibo
//
//  Created by Tom on 16/7/18.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>
#import "KLWBViewModel.h"
@interface KLWBViewController : UIViewController

@property (nonatomic,strong,readonly) id viewModel;

- (instancetype)initWithViewModel:(id)viewModel;

- (void)prepareUI;

- (void)bindViewModel;

@end
