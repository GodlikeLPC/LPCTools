//
//  LPCTableView.m
//  EverydayNews
//
//  Created by 李沛池 on 2017/8/6.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCTableView.h"

@implementation LPCTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    //高度自适应
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = 44;
    
//    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

@end
