//
//  MIkeFlow.m
//  collectionView-picture
//
//  Created by mike on 16/6/8.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "MIkeFlow.h"

@implementation MIkeFlow
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *superArray = [super layoutAttributesForElementsInRect:rect];
    
    // 屏幕中心x的值
    CGFloat screenCenterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width/2;
    
    
    for (UICollectionViewLayoutAttributes *attribute in superArray) {
        
        // 计算差值
        CGFloat deltaX = ABS(screenCenterX - attribute.center.x);
        
        
        // 计算出比例
        CGFloat scalDelta = 1.2 -  deltaX / ((self.collectionView.frame.size.width + attribute.size.width)/2) * 0.5;
//        NSLog(@"%f",scalDelta);
        
        attribute.transform = CGAffineTransformMakeScale(scalDelta, scalDelta);
    }
    
    return superArray;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 计算一个可见范围
    CGRect visibleRect = CGRectZero;
    
    visibleRect.origin = proposedContentOffset;
    visibleRect.size = self.collectionView.frame.size;
    
    NSArray *superArray = [super layoutAttributesForElementsInRect:visibleRect];
    
    // 计算屏幕中心
    CGFloat screenCenterX = proposedContentOffset.x + self.collectionView.frame.size.width/2;
    
    CGFloat minDelta = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *attributes in superArray) {
        CGFloat deltaX = attributes.center.x - screenCenterX;
        
        if (ABS(minDelta) > ABS(deltaX)) {
            minDelta = deltaX;
        }
        
    }
    
    
    return CGPointMake(proposedContentOffset.x + minDelta, proposedContentOffset.y);
}

// 当 collectionView的bounds 改变的时候, 就会刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
- (void)prepareLayout {
    [super prepareLayout];
    
    CGFloat itemHeight = self.collectionView.frame.size.height * 0.8;
    
    CGFloat itemWidth = self.collectionView.frame.size.height * 0.6;
    
    self.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat margin = (self.collectionView.frame.size.width - itemWidth)/2;
//    NSLog(@"%f",margin);
    
    self.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
}
@end
