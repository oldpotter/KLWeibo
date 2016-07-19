//
//  KLWBTableViewCell.h
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import <ReactiveCocoa.h>

#define kPadding 5
#define kInsets UIEdgeInsetsMake(kPadding, kPadding, kPadding, kPadding)
#define kInsetsMultiple(x) UIEdgeInsetsMake(kPadding * x, kPadding * x, kPadding * x, kPadding * x)


@interface KLWBTableViewCell : UITableViewCell

/**
 *  view model
 */
@property (nonatomic,strong) id viewModel;

/**
 *  准备UI
 */
- (void)prepareUI;
/**
 *  绑定
 */
- (void)bindViewModel;

- (void)setCellViewModel:(id)viewModel;

@end
