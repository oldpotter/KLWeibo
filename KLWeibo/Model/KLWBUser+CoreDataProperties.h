//
//  KLWBUser+CoreDataProperties.h
//  
//
//  Created by Tom on 16/7/20.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KLWBUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface KLWBUser (CoreDataProperties)

@property (nonatomic) int16_t followers_count;
@property (nonatomic) int16_t friends_count;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *profile_image_url;
@property (nullable, nonatomic, retain) NSString *screen_name;
@property (nonatomic) int16_t statuses_count;
@property (nullable, nonatomic, retain) NSString *user_description;
@property (nonatomic) int64_t wb_id;
@property (nullable, nonatomic, retain) NSString *wb_strId;

@end

NS_ASSUME_NONNULL_END
