//
//  MikeCollectionModel.m
//  collectionView-picture
//
//  Created by mike on 16/6/9.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "MikeCollectionModel.h"

@implementation MikeCollectionModel
+(instancetype)modelWithIcon:(NSString *)iconName index:(NSString *)indexPath{
    MikeCollectionModel *model=[[MikeCollectionModel alloc]init];
    
    model.iconName=iconName;
    model.indexPath=indexPath;
    
    return model;

}
- (NSString *)description
{

    return [NSString stringWithFormat:@"<%@: %p> {buyCount :%@ ,icon: %@ }",self.class,self,self.iconName,self.indexPath];
    //<%@: %p> 类名 指针 {name :%@ ,icon: %@ } 需要描述的东西
}
@end
