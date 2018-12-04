//
//  LPCFunctionDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCFunctionDefine_h
#define LPCFunctionDefine_h


#ifdef DEBUG
#define LPCLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define LPCLog(format, ...)
#endif



//数字转string
#define STRINGFROMNUM(num) [NSString stringWithFormat:@"%@",@(num)]

/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}


#endif /* LPCFunctionDefine_h */
