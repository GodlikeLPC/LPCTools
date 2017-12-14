//
//  UIView+LPCCategoryTool.h
//  LPCTools
//
//  Created by 李沛池 on 2017/12/14.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LPCCategoryTool)

- (UIViewController*)viewController;

//获取当前最顶层的ViewController
- (UIViewController *)topViewController;

@end
