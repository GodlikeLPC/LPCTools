//
//  LPCSystemDefine.h
//  EverydayNews
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#ifndef LPCSystemDefine_h
#define LPCSystemDefine_h


// 获取沙盒
#define DOCUMENT_PATH NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)[0]

// 获取系统版本
#define VERSION_IOS [[[UIDevice currentDevice] systemVersion] floatValue]
//系统版本是否大于8.0
#define IOS_8 ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)

// 判断是否 Retina屏、设备是否Iphone 5、是否是iPad
#define ISRETINA ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define ISPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#endif /* LPCSystemDefine_h */
