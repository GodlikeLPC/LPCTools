//
//  LPCMBProgressHUD.m
//  LPCTools
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCMBProgressHUD.h"

@implementation LPCMBProgressHUD


+ (LPCMBProgressHUD *)showHUDAddedTo:(UIView *)view animated:(BOOL)animated
{
    //设置菊花颜色
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    LPCMBProgressHUD *hud = [super showHUDAddedTo:view animated:animated];
    // 显示一张图片(mode必须写在customView设置之前)
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.bezelView.color = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.8];
    
    return hud;
}

+ (void)showText:(NSString *)text name:(NSString *)name
{
    // 显示加载失败
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    // 显示一张图片(mode必须写在customView设置之前)
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.color = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.8];
    // 设置一张图片
    name = [NSString stringWithFormat:@"LPCImages.bundle/%@", name];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
    hud.label.text = text;
    hud.label.textColor = [UIColor whiteColor];
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒后自动隐藏
    [hud hideAnimated:YES afterDelay:1];
}

+ (void)showSuccessWithText:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showText:text name:@"lpcImages_hud_success"];
    });
}

+ (void)showErrorWithText:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showText:text name:@"lpcImages_hud_error"];
    });
}

- (void)show
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showAnimated:YES];
    });
}

- (void)hide
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideAnimated:YES];
    });
}


@end
