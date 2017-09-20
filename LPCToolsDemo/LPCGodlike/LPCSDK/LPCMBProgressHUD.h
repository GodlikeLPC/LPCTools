//
//  LPCMBProgressHUD.h
//  EverydayNews
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface LPCMBProgressHUD : MBProgressHUD

+ (void)showSuccessWithText:(NSString *)text;
+ (void)showErrorWithText:(NSString *)text;

- (void)show;
- (void)hide;

@end
