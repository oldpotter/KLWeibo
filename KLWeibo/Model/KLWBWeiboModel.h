//
//  KLWBWeiboModel.h
//  KLWeibo
//
//  Created by Tom on 16/7/19.
//  Copyright © 2016年 ZJCT. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface KLWBWeiboModel : MTLModel<MTLJSONSerializing>
/**
 *  内容
 */
@property (nonatomic,copy) NSString *text;
/**
 *  时间
 */
@property (nonatomic,strong) NSDate *date;

@end
