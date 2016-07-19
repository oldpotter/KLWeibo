//
//  KLWBTableViewCellViewModel.m
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBTableViewCellViewModel.h"

@implementation KLWBTableViewCellViewModel

- (instancetype)initWithModel:(id)model
{
    if (self = [super init]) {
        self.model = model;
    }
    return self;
}

@end
