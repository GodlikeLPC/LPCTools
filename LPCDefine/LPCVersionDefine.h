//
//  LPCVersionDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCVersionDefine_h
#define LPCVersionDefine_h

//当前app版本号 用于显示
#define VERSION_App         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
//当前app版本号 用于强制更新(整数)
#define VERSION_App_Int     [[VERSION_App stringByReplacingOccurrencesOfString:@"." withString:@""] intValue]

//获取系统版本
#define VERSION_IOS_Apple   [[[UIDevice currentDevice] systemVersion] floatValue]
//系统版本是否大于9.0
#define VERSION_IOS_9+      ([UIDevice currentDevice].systemVersion.doubleValue >= 9.0)


#endif /* LPCVersionDefine_h */
