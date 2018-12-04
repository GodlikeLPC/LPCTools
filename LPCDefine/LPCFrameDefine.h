//
//  LPCFrameDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCFrameDefine_h
#define LPCFrameDefine_h


//状态栏高度
#define HEIGHT_StateBar       (20.f)

//tabbar高度
#define HEIGHT_TABBAR_Normal  (49.f)
#define HEIGHT_TABBAR_X       (83.f)

//navbar高度
#define HEIGHT_NAVBAR_Normal  (64.f)
#define HEIGHT_NAVBAR_X       (88.f)

// 获取屏幕尺寸
#define SIZE_Screen           [[UIScreen mainScreen] bounds].size
#define WIDTH_Screen          [[UIScreen mainScreen] bounds].size.width
#define HEIGHT_Screen         [[UIScreen mainScreen] bounds].size.height

#define SCREEN_Size           SIZE_Screen
#define SCREEN_Width          WIDTH_Screen
#define SCREEN_Height         HEIGHT_Screen

// 获取屏幕比例
#define SCALE_Screen          ([UIScreen mainScreen].bounds.size.width/320.f)
#define SCREEN_Scale          SCALE_Screen

//全屏尺寸
#define FRAME_Screen          CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
#define SCREEN_Frame          FRAME_Screen


#endif /* LPCFrameDefine_h */
