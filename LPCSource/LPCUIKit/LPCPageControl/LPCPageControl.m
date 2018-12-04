//
//  LPCPageControl.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/4.
//

#import "LPCPageControl.h"


const float sizeDot = 5.f;
const float magrin  = 5.f; // 圆点间距

@implementation LPCPageControl

- (void)layoutSubviews
{
    [super layoutSubviews];
    //计算圆点间距
    CGFloat marginX = sizeDot + magrin;
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX;
    //设置新frame
    self.frame = CGRectMake(SCREENWIDTH/2-(newW + sizeDot)/2, self.frame.origin.y, newW + sizeDot, self.frame.size.height);
    //遍历subview,设置圆点frame
    for (int i = 0; i < [self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, sizeDot, sizeDot)];
    }
}

//重写setCurrentPage方法，可设置圆点大小
- (void)setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    
    for (UIImageView* dotView in self.subviews) {
        dotView.frame = CGRectMake(dotView.frame.origin.x, dotView.frame.origin.y, sizeDot, sizeDot);
        dotView.layer.cornerRadius = sizeDot/2;
    }
}

@end
