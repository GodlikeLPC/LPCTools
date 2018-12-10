//
//  CALayer+LPCTools.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "CALayer+LPCTools.h"

@implementation CALayer (LPCTools)

//适配xib设置的属性
- (void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}


- (void)setShadowUIColor:(UIColor*)color
{
    self.shadowColor = color.CGColor;
}

- (UIColor*)shadowUIColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}

@end
