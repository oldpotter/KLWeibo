//
//  KLWBWeibo+CoreDataProperties.h
//  
//
//  Created by Tom on 16/7/20.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KLWBWeibo.h"
#import "KLWBUser.h"
NS_ASSUME_NONNULL_BEGIN

@interface KLWBWeibo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *bmiddle_pic;
@property (nonatomic) NSTimeInterval date;
@property (nullable, nonatomic, retain) NSString *original_pic;
@property (nullable, nonatomic, retain) id pic_urls;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSString *thumbnail_pic;
@property (nonatomic) int64_t wb_id;
@property (nullable, nonatomic, retain) NSString *wb_strId;
@property (nullable, nonatomic, retain) KLWBUser *user;

@end

NS_ASSUME_NONNULL_END
