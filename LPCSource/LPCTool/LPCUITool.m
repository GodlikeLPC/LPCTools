//
//  LPCUITool.m
//  LPCTools
//
//  Created by 李沛池 on 2018/11/30.
//

#import "LPCUITool.h"

@implementation LPCUITool


//获取在导航栈中上一层级的ViewController
+ (UIViewController *)viewControllerInNavigationUpLevel:(UIViewController *)viewController
{
    NSArray *arrayVCs = viewController.navigationController.viewControllers;
    if (arrayVCs.count >= 2) {
        return arrayVCs[arrayVCs.count - 2];
    }else {
        return [arrayVCs lastObject];
    }
}

//展示系统提示框(iPhone快捷方式)
+ (UIAlertController *)showAlertControllerWithViewController:(UIViewController *)viewController
                                              preferredStyle:(UIAlertControllerStyle)preferredStyle
                                                       title:(NSString *)title
                                                     message:(NSString *)message
                                                 cancelTitle:(NSString *)cancelTitle
                                               firstBtnTitle:(NSString *)firstBtnTitle
                                              secondBtnTitle:(NSString *)secondBtnTitle
                                                 actionBlock:(void(^)(NSInteger index))actionBlock
{
    return [self showAlertControllerWithViewController:viewController preferredStyle:preferredStyle sourceView:nil title:title message:message cancelTitle:cancelTitle firstBtnTitle:firstBtnTitle secondBtnTitle:secondBtnTitle actionBlock:actionBlock];
}

//展示系统提示框
+ (UIAlertController *)showAlertControllerWithViewController:(UIViewController *)viewController
                                              preferredStyle:(UIAlertControllerStyle)preferredStyle
                                                  sourceView:(UIView *)sourceView
                                                       title:(NSString *)title
                                                     message:(NSString *)message
                                                 cancelTitle:(NSString *)cancelTitle
                                               firstBtnTitle:(NSString *)firstBtnTitle
                                              secondBtnTitle:(NSString *)secondBtnTitle
                                                 actionBlock:(void(^)(NSInteger index))actionBlock
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    // 创建按钮 注意取消按钮只能添加一个
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        if (actionBlock) {
            actionBlock(0);
        }
    }];
    [alertController addAction:cancelAction];
    //第一个按钮
    if (firstBtnTitle.length > 0) {
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:firstBtnTitle style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction *action) {
            if (actionBlock) {
                actionBlock(1);
            }
        }];
        [alertController addAction:firstAction];
    }
    //第二个按钮
    if (secondBtnTitle.length > 0) {
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:secondBtnTitle style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction *action) {
            if (actionBlock) {
                actionBlock(2);
            }
        }];
        [alertController addAction:secondAction];
    }
    
    //如果传了SourceView 则认定为使用的是iPad
    if (sourceView) {
        UIPopoverPresentationController *popPresenter = [alertController popoverPresentationController];
        popPresenter.sourceView = sourceView;
        popPresenter.sourceRect = sourceView.bounds;
        [viewController presentViewController:alertController animated:YES completion:nil];
    }else {
        [viewController presentViewController:alertController animated:YES completion:NULL];
    }
    
    return alertController;
}

//根据颜色生成图片
+ (UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
