//
//  UIView+LPCTools.h
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LPCTools)

/**
 寻找当前view所属viewController
 */
- (UIViewController*)viewController;

/**
 获取当前最顶层的ViewController
 */
- (UIViewController *)topViewController;

/**
 给view添加点击空白键盘回收
 */
- (void)addActionReturnKeyBoard;

@end

NS_ASSUME_NONNULL_END
