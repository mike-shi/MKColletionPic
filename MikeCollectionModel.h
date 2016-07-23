//
//  MikeCollectionModel.h
//  collectionView-picture
//
//  Created by mike on 16/6/9.
//  Copyright © 2016年 mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MikeCollectionModel : NSObject
@property(nonatomic,copy)NSString *iconName;
@property(nonatomic,copy)NSString *indexPath;
+(instancetype)modelWithIcon:(NSString *)iconName index:(NSString *)indexPath;
@end
