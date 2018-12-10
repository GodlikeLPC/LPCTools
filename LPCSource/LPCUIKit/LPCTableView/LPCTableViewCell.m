//
//  LPCTableViewCell.m
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import "LPCTableViewCell.h"

const CGFloat LPCTableViewCell_BtnTag_Basic = 100.f; //默认tag值

@implementation LPCTableViewCell

//if (_delegate && [_delegate respondsToSelector:@selector(actionCellClickWithBtnIndex:cellIndexPath:object:)]) { }

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
