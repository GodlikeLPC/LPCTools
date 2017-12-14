//
//  LPCCommentApp.m
//  LPCTools
//
//  Created by 李沛池 on 2017/7/24.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCCommentApp.h"
#import "LPCAlertController.h"

@interface LPCCommentApp ()

//好评回调
@property (nonatomic,copy) void(^commentAppBlock)(void);
//吐槽回调
@property (nonatomic,copy) void(^feedbackBlock)(void);

@end

@implementation LPCCommentApp

singleton_implementation(LPCCommentApp);

//配置评论规则
+ (void)configCommentLogicWithTitle:(NSString *)title
                            message:(NSString *)message
                    commentAppBlock:(void (^)(void))commentAppBlock
                      feedbackBlock:(void (^)(void))feedbackBlock
{
    [LPCCommentApp sharedLPCCommentApp].commentAppBlock = commentAppBlock;
    [LPCCommentApp sharedLPCCommentApp].feedbackBlock = feedbackBlock;
    
    //当前版本号
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    float appVersion = [[infoDictionary objectForKey:@"CFBundleShortVersionString"] floatValue];
    //userDefaults里的天数
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    int udtheDays = [[userDefaults objectForKey:@"theDays"] intValue];
    //userDefaults里的版本号
    float udAppVersion = [[userDefaults objectForKey:@"appVersion"] intValue];
    //userDefaults里用户上次的选项
    int udUserChoose = [[userDefaults objectForKey:@"userOptChoose"] intValue];
    //时间戳的天数
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    int daySeconds = 24 * 60 * 60;
    int theDays = interval / daySeconds;
    //如果从未弹出过 保存当前时间 第二天弹出
    if (!udUserChoose && udtheDays == 0) {
        [userDefaults setObject:[NSString stringWithFormat:@"%d",theDays] forKey:@"theDays"];
        udtheDays = theDays;
    }
    
    //版本升级之后的处理,全部规则清空,开始弹窗
    if (udAppVersion && appVersion > udAppVersion) {
        [userDefaults removeObjectForKey:@"theDays"];
        [userDefaults removeObjectForKey:@"appVersion"];
        [userDefaults removeObjectForKey:@"userOptChoose"];
        [[LPCCommentApp sharedLPCCommentApp] showCommentView:title message:message];
    }
    //1,从来没弹出过的 一天之后弹出
    //2,用户选择不好用我要提意见，7天之后再弹出
    //3,用户选择残忍的拒绝后，7天内，每过1天会弹一次
    //4,用户选择残忍的拒绝的30天后，会弹出
    else if ((!udUserChoose && theDays-udtheDays>=1) ||
             (udUserChoose==2 && theDays-udtheDays>7) ||
             (udUserChoose>=3 && theDays-udtheDays<=7 && theDays-udtheDays>udUserChoose-3) ||
             (udUserChoose>=3 && theDays-udtheDays>30))
    {
        [[LPCCommentApp sharedLPCCommentApp] showCommentView:title message:message];
    }
}

//展示评价view
- (void)showCommentView:(NSString *)title message:(NSString *)message
{
    LPCAlertController *alertController = [LPCAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"再用用看" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self clickActionIndex:0];
    }];
    [alertController addAction:cancelAction];
    UIAlertAction *goodAction = [UIAlertAction actionWithTitle:@"赞，给个好评" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self clickActionIndex:1];
    }];
    [alertController addAction:goodAction];
    UIAlertAction *feedbackAction = [UIAlertAction actionWithTitle:@"吐槽一下" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self clickActionIndex:2];
    }];
    [alertController addAction:feedbackAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)clickActionIndex:(NSInteger)buttonIndex
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //当前时间戳的天数
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    int daySeconds = 24 * 60 * 60;
    NSInteger theDays = interval / daySeconds;
    //当前版本号
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    float appVersion = [[infoDictionary objectForKey:@"CFBundleShortVersionString"] floatValue];
    //userDefaults里版本号
    float udAppVersion = [[userDefaults objectForKey:@"appVersion"] intValue];
    //userDefaults里用户选择项目
    int udUserChoose = [[userDefaults objectForKey:@"userOptChoose"] intValue];
    //userDefaults里用户天数
    int udtheDays = [[userDefaults objectForKey:@"theDays"] intValue];
    
    //当前版本比userDefaults里版本号高
    if (appVersion>udAppVersion) {
        [userDefaults setObject:[NSString stringWithFormat:@"%f",appVersion] forKey:@"appVersion"];
    }
    
    switch (buttonIndex) {
        case 1: //好评
            [userDefaults setObject:@"1" forKey:@"userOptChoose"];
            [userDefaults setObject:[NSString stringWithFormat:@"%@",@(theDays)] forKey:@"theDays"];
            [LPCCommentApp sharedLPCCommentApp].commentAppBlock();
            break;
        case 2: //吐槽
            [userDefaults setObject:@"2" forKey:@"userOptChoose"];
            [userDefaults setObject:[NSString stringWithFormat:@"%@",@(theDays)] forKey:@"theDays"];
            [LPCCommentApp sharedLPCCommentApp].feedbackBlock();
            break;
        case 0: //拒绝
            if (udUserChoose<=3 || theDays-[[userDefaults objectForKey:@"theDays"] intValue]>30) {
                [userDefaults setObject:@"3" forKey:@"userOptChoose"];
                [userDefaults setObject:[NSString stringWithFormat:@"%@",@(theDays)] forKey:@"theDays"];
            }else{
                [userDefaults setObject:[NSString stringWithFormat:@"%@",@(theDays-udtheDays+3)] forKey:@"userOptChoose"];
            }
            break;
        default:
            break;
    }
    NSLog(@"%@",[userDefaults objectForKey:@"appVersion"]);
    NSLog(@"%@",[userDefaults objectForKey:@"userOptChoose"]);
    NSLog(@"%@",[userDefaults objectForKey:@"theDays"]);
}

@end
