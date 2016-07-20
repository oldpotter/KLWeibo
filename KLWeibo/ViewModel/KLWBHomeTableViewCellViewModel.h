//
//  KLWBHomeTableViewCellViewModel.h
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBTableViewCellViewModel.h"
#import "KLWBWeibo.h"

@interface KLWBHomeTableViewCellViewModel : KLWBTableViewCellViewModel

@property (nonatomic,strong) KLWBWeibo *model;

@end
