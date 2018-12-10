//
//  LPCScrollView.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "LPCScrollView.h"

@implementation LPCScrollView

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

- (void)configUI
{
    //    self.backgroundColor = COLOR_FFFFFF(0xf5f5f5);
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    
    //debug : iOS11.0 scrollView|tableView向下偏移20
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

@end
