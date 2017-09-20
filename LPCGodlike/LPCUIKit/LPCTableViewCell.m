//
//  LPCTableViewCell.m
//  EverydayNews
//
//  Created by 李沛池 on 2017/8/6.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCTableViewCell.h"

@implementation LPCTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self layoutIfNeeded];
    
    [self initUI];
}

- (void)initUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)updateData:(id)model
{
    
}

- (void)updateData:(id)model withDic:(id)dic
{
    
}

- (void)updateData:(id)model withObject:(id)object
{
    
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)delegateAction:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(cellActionWithSender:withCell:withIndexPath:withObject:)])
    {
        [self.delegate cellActionWithSender:sender withCell:self withIndexPath:self.indexPath withObject:self.obj];
    }
}
@end
