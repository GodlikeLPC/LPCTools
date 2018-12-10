//
//  LPCTableView.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "LPCTableView.h"
#import "UITableView+LPCTools.h"

@implementation LPCTableView

- (void)reloadData_LPC
{
    if (self.delegate_lpc && [self.delegate_lpc respondsToSelector:@selector(lpcTableViewBeforeReloadData)]) {
        [self.delegate_lpc lpcTableViewBeforeReloadData];
    }
    
    [super reloadData_LPC];
    
    if (self.delegate_lpc && [self.delegate_lpc respondsToSelector:@selector(lpcTableViewAfterReloadData)]) {
        [self.delegate_lpc lpcTableViewAfterReloadData];
    }
}

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
    //    self.backgroundColor = COLOR_FFFFFF(0xf5f5f5);
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //高度自适应
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = 44;
    self.estimatedSectionFooterHeight = 0;
    self.estimatedSectionHeaderHeight = 0;
    
    if (@available(iOS 11.0, *)) { //解决VC中的tableView向下移动部分距离
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

@end
