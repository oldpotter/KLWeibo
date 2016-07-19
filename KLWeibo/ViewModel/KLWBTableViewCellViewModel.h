//
//  KLWBTableViewCellViewModel.h
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLWBTableViewCellViewModel : NSObject

@property (nonatomic,strong) KLWBTableViewCellViewModel *model;

- (instancetype)initWithModel:(id)model;

@end
