//
//  LPCEnum.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCEnum_h
#define LPCEnum_h

//通知类型
typedef NS_ENUM(NSInteger, LPCNotificationType) {
    LPCNotificationType_doneLaunchAD = 0, //启动广告加载完成或者新版本引导
    LPCNotificationType_LoginSuccess      //登录成功 用于页面刷新
};

//分享平台
typedef NS_ENUM(NSInteger, SharePlatformType) {
    SharePlatformType_WechatSession   = 0, //微信好友
    SharePlatformType_WechatTimeLine  = 1, //微信朋友圈
    SharePlatformType_QQ              = 2, //QQ好友
    SharePlatformType_Sina            = 3, //新浪微博
};

//分享的结果
typedef NS_ENUM(NSInteger, ShareResultType) {
    ShareResultType          = 0, //分享成功
    ShareResultType_Failure  = 1, //分享失败
    ShareResultType_Cancel   = 2, //分享取消
};

#endif /* LPCEnum_h */
