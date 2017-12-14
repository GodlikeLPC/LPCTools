//
//  LPCBaseTableView.m
//  LPCTools
//
//  Created by 李沛池 on 2017/12/14.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCBaseTableView.h"

@implementation LPCBaseTableView


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

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    //高度自适应
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = 44;
    
    //    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}


@end
