//
//  LPCView.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "LPCView.h"

const CGFloat LPCView_BtnTag_Basic = 100; //默认tag值

@implementation LPCView

-(void)dealloc
{
    NSLog(@"LPC_deallocViewClass : %@",[self class]);
}

- (instancetype)init
{
    self = [super init];
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
//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
}

- (void)updateData:(id)object{}

- (void)updateDataWithIndex:(NSInteger)index{}

@end
