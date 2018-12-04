//
//  LPCCollectionViewCell.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/4.
//

#import "LPCCollectionViewCell.h"

@implementation LPCCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self configUI];
}

- (void)configUI
{
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateData:(id)model{}

- (void)updateDataWithIndex:(NSInteger)index obj:(id)object{}

@end
