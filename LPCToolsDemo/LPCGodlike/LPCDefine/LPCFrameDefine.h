//
//  LPCFrameDefine.h
//  EverydayNews
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#ifndef LPCFrameDefine_h
#define LPCFrameDefine_h


// NavBar高度
#define NAVHEIGHT 64
// TabBar高度
#define TABBAR_HEIGHT 49

// 获取屏幕 宽度、高度
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// 获取屏幕比例
#define SCREEN_SCALE ([UIScreen mainScreen].bounds.size.width/320)
//全屏尺寸
#define FRAME_SCREEN CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)


#endif /* LPCFrameDefine_h */
