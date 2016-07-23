//
//  ViewController.m
//  collectionView-picture
//
//  Created by mike on 16/6/8.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "ViewController.h"
#import "SHWCollectionCell.h"
#import "MIkeFlow.h"
#import "MikeCollectionModel.h"
#import "modeGroup.h"
#define ViewX self.view.bounds.size.width
@interface ViewController ()<UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collection;
@property(nonatomic,strong)NSMutableArray  *array;
@end
static NSString *ID=@"collection";
@implementation ViewController

-(UICollectionView *)collection{
    
    if (!_collection) {
        
        MIkeFlow *flowLayout=[[MIkeFlow alloc]init];
     
        _collection= [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, 375, 375) collectionViewLayout:flowLayout];
        
        
        _collection.dataSource=self;
        
        _collection.backgroundColor=[UIColor grayColor];
        [self.view addSubview:_collection];
        
    }
    return _collection;
}
-(NSMutableArray *)array{
    
    if (!_array) {
        
        _array= [[NSMutableArray alloc]init];
        MikeCollectionModel *model1=[MikeCollectionModel modelWithIcon:@"img_01" index:@"1"];
        
         MikeCollectionModel *model2=[MikeCollectionModel modelWithIcon:@"img_02" index:@"2"];
         MikeCollectionModel *model3=[MikeCollectionModel modelWithIcon:@"img_03" index:@"3"];
         MikeCollectionModel *model4=[MikeCollectionModel modelWithIcon:@"img_04" index:@"4"];
         MikeCollectionModel *model5=[MikeCollectionModel modelWithIcon:@"img_05" index:@"5"];
     
        modeGroup *group=[[modeGroup alloc]init];
        group.array=@[model1,model2,model4,model5,model3];
        
    
        
        [_array addObject:group];
//        [_array addObject:model2];
       
    }
    [self.collection reloadData];
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self collection];
    //    NSLog(@"%@",self.collection.bounds);
    [self array];
//    NSLog(@"%@",_array);
    [_collection registerClass:[SHWCollectionCell class] forCellWithReuseIdentifier:ID];
 
    
}

#pragma mark-collectionViewDELAGETA
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    modeGroup *model=_array[section];
    NSLog(@"%lu",(unsigned long)model.array.count);
    
    return model.array.count;

}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    SHWCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    
    cell.backgroundColor=[UIColor redColor];

    modeGroup *model=_array[indexPath.section];
    
    MikeCollectionModel *md=model.array[indexPath.row];
    
    NSLog(@"%@",md.iconName);
    cell.model=md;
    
    return cell;

}




@end
