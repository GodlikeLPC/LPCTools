//
//  LPCUITool.h
//  LPCTools
//
//  Created by 李沛池 on 2018/11/30.
//

#import <Foundation/Foundation.h>

/**
 视图相关方法
 */
@interface LPCUITool : NSObject

/**
 获取在导航栈中上一层级的ViewController
 */
+ (UIViewController *)viewControllerInNavigationUpLevel:(UIViewController *)viewController;

/**
 展示系统提示框(iPhone快捷方式)
 */
+ (UIAlertController *)showAlertControllerWithViewController:(UIViewController *)viewController
                                              preferredStyle:(UIAlertControllerStyle)preferredStyle
                                                       title:(NSString *)title
                                                     message:(NSString *)message
                                                 cancelTitle:(NSString *)cancelTitle
                                               firstBtnTitle:(NSString *)firstBtnTitle
                                              secondBtnTitle:(NSString *)secondBtnTitle
                                                 actionBlock:(void(^)(NSInteger index))actionBlock;
/**
 展示系统提示框
 
 @param viewController 展示到的VC
 @param preferredStyle 类型 Alert/ActionSheet
 @param sourceView 需要展示到的view上 iPad使用
 @param title 标题
 @param message 内容
 @param cancelTitle 取消按钮文字
 @param firstBtnTitle 第一个按钮文字
 @param secondBtnTitle 第二个按钮文字
 @param actionBlock 返回block
 @return 返回创建的AlertController
 */
+ (UIAlertController *)showAlertControllerWithViewController:(UIViewController *)viewController
                                              preferredStyle:(UIAlertControllerStyle)preferredStyle
                                                  sourceView:(UIView *)sourceView
                                                       title:(NSString *)title
                                                     message:(NSString *)message
                                                 cancelTitle:(NSString *)cancelTitle
                                               firstBtnTitle:(NSString *)firstBtnTitle
                                              secondBtnTitle:(NSString *)secondBtnTitle
                                                 actionBlock:(void(^)(NSInteger index))actionBlock;

@end
