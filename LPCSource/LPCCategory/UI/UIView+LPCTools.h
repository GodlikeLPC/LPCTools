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
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property(nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property(nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property(nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property(nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property(nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property(nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property(nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property(nonatomic) CGFloat centerY;

/**
 * Shortcut for frame.origin
 *
 * Sets frame.origin = origin
 */
@property(nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 *
 * Sets frame.size = size
 */
@property(nonatomic) CGSize size;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * resignFirstResponser, hide Keyboard.
 */
- (void)resignFirstResponser;

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
