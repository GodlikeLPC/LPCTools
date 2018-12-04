//
//  LPCSystemDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCSystemDefine_h
#define LPCSystemDefine_h


//判断是否 Retina屏
#define SYSTEM_Retina        ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//设备是否Iphone 5
#define SYSTEM_Iphone5       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define SYSTEM_IPHONE_Plus   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(414*3, 736*3), [[UIScreen mainScreen] currentMode].size) : NO)
//是否是iPad
#define SYSTEM_Ipad          (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#endif /* LPCSystemDefine_h */
