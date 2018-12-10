//
//  UITableView+LPCTools.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "UITableView+LPCTools.h"
#import <objc/runtime.h>

@implementation UITableView (LPCTools)

+ (void)load
{
    Method originalM = class_getInstanceMethod([self class], @selector(reloadData));
    Method exchangeM = class_getInstanceMethod([self class], @selector(reloadData_LPC));
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

- (void)reloadData_LPC
{
    [self reloadData_LPC];
}

@end
