//
//  SHWCollectionCell.m
//  collectionView-picture
//
//  Created by mike on 16/6/8.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "SHWCollectionCell.h"
#import "MikeCollectionModel.h"
@interface SHWCollectionCell()
@property(nonatomic,strong)UIImageView  *image;
@property(nonatomic,strong)UILabel *label;
@end
@implementation SHWCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       _image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.contentView.bounds.size.width-10, self.contentView.bounds.size.height-10)];
        [self.contentView addSubview:_image];
        _label=[[UILabel alloc]initWithFrame:CGRectMake(5, 180, self.contentView.bounds.size.width-10, 20)];
        [_image addSubview:_label];
        _label.textAlignment=NSTextAlignmentCenter;
        
//        _image.image=[UIImage imageNamed:@"img_02"];        
        
    }
    return self;
}
//-(UIImageView *)image{
//    
//    if (!_image) {
//        
//        _image= [[UIImageView alloc]init];
//        _image.frame=CGRectMake(5, 5, self.contentView.bounds.size.width-10, self.contentView.bounds.size.height-10);
//        [self.contentView addSubview:_image];
////        _image.image=[UIImage imageNamed:@"_img_02"];
//        
//    }
//    return _image;
//}

-(void)setModel:(MikeCollectionModel *)model{


    _model=model;
//    UIImage *image=[UIImage imageNamed:model.iconName];
//    [_image setImage:image forState:UIControlStateNormal];
    _image.image=[UIImage imageNamed:model.iconName];
    _label.text=model.indexPath;
    
}

@end
