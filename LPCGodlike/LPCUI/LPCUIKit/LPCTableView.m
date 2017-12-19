//
//  LPCTableView.m
//  LPCTools
//
//  Created by 李沛池 on 2017/8/6.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCTableView.h"

@implementation LPCTableView

- (void)configUI
{
    if (@available(iOS 11.0, *)) { //解决VC中的tableView向下移动部分距离
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

- (instancetype)init
{
    self = [super init];
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

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configUI];
    }
    return self;
}

@end
