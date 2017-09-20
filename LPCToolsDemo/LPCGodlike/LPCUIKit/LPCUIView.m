//
//  LPCUIView.m
//  EverydayNews
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCUIView.h"

@implementation LPCUIView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self layoutIfNeeded];
    
    [self initData];
    [self initUI];
}

- (void)initData
{
    
}

- (void)initUI
{
    
}

- (void)updateData:(id)item
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
    if ([self.delegate respondsToSelector:@selector(viewActionWithSender:withView:withObject:)])
    {
        [self.delegate viewActionWithSender:sender withView:self withObject:self.obj];
    }
}

@end
