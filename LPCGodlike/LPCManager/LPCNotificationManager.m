//
//  LPCNotificationManager.m
//  EverydayNews
//
//  Created by 李沛池 on 2017/8/8.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCNotificationManager.h"

@implementation LPCNotificationManager

singleton_implementation(LPCNotificationManager);

- (void)addObserver:(LPCNotificationType)name obj:(id)obj sel:(SEL)sel controll:(id)controll {
    // 注册
    [[NSNotificationCenter defaultCenter] addObserver:controll selector:sel name:LPCNotification_Type(name) object:obj];
}

- (void)postNotification:(LPCNotificationType)name obj:(id)obj userInfo:(NSDictionary *)userInfo {
    // 发送
    [[NSNotificationCenter defaultCenter] postNotificationName:LPCNotification_Type(name) object:obj userInfo:userInfo];
}

- (void)removeObserver:(id)observer type:(LPCNotificationType)name {
    //删除
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:LPCNotification_Type(name) object:nil];
}

- (void)removeObserver:(id)observer {
    // 删除
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

@end
