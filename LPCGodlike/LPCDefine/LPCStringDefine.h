//
//  LPCStringDefine.h
//  LPCTools
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#ifndef LPCStringDefine_h
#define LPCStringDefine_h


//数据库名字
#define DatabaseName @"LPCGodlike.sqlite"

/*
 使用的时候在实现的代理方法中做判断
 判断的name需要做一些处理 kNotification_Type(t) 通过这个宏做处理 以达到匹配的程度
 */
#define LPCNotification_Type(type) [NSString stringWithFormat:@"LPCNotification_%ld",(long)type]


#endif /* LPCStringDefine_h */
