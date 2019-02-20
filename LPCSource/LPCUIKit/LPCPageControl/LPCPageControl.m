//
//  LPCPageControl.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/4.
//

#import "LPCPageControl.h"

const float sizeDot_lpc = 5.f;
const float magrin_lpc  = 5.f; // 圆点间距

@implementation LPCPageControl

- (void)layoutSubviews
{
    [super layoutSubviews];
    //计算圆点间距
    CGFloat marginX = sizeDot_lpc + magrin_lpc;
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX;
    //设置新frame
    self.frame = CGRectMake(WIDTH_Screen/2-(newW + sizeDot_lpc)/2, self.frame.origin.y, newW + sizeDot_lpc, self.frame.size.height);
    //遍历subview,设置圆点frame
    for (int i = 0; i < [self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, sizeDot_lpc, sizeDot_lpc)];
    }
}

//重写setCurrentPage方法，可设置圆点大小
- (void)setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    
    for (UIImageView* dotView in self.subviews) {
        dotView.frame = CGRectMake(dotView.frame.origin.x, dotView.frame.origin.y, sizeDot_lpc, sizeDot_lpc);
        dotView.layer.cornerRadius = sizeDot_lpc/2;
    }
}

@end
