//
//  KLWBHomeTableViewCellViewModel.m
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import "KLWBHomeTableViewCellViewModel.h"

@implementation KLWBHomeTableViewCellViewModel
@synthesize model;

- (void)initialize
{
    self.picURLs = [self.model.pic_urls linq_select:^id(NSDictionary *dict) {
        return dict[@"thumbnail_pic"];
    }];
}

@end
