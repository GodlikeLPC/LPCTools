//
//  LPCNotificationManager.h
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "LPCManager.h"

/**
 通知中心
 */
@interface LPCNotificationManager : LPCManager

singleton_interface(LPCNotificationManager);

//注册
- (void)addObserver:(LPCNotificationType)name obj:(id)obj sel:(SEL)sel controll:(id)controll;
//发送
- (void)postNotification:(LPCNotificationType)name  obj:(id)obj userInfo:(NSDictionary *)userInfo;
//移除
- (void)removeObserver:(id)observer type:(LPCNotificationType)name;
- (void)removeObserver:(id)observer;

@end
