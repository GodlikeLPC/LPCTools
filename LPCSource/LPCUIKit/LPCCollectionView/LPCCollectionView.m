//
//  LPCCollectionView.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/4.
//

#import "LPCCollectionView.h"

@implementation LPCCollectionView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    //    self.backgroundColor = COLOR_FFFFFF(0xf5f5f5);
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    
}

@end
