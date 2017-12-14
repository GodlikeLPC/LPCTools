//
//  LPCFunctionDefine.h
//  LPCTools
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#ifndef LPCFunctionDefine_h
#define LPCFunctionDefine_h

#pragma mark - 单例
// @interface
#define singleton_interface(className) \
+ (className *)shared##className;

// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}


#pragma mark - 更方便的使用强弱引用

#define LPCCreateWeakSelf   __weak   __typeof(&*self)weakSelf = self;
#define LPCCreateStrongSelf __strong __typeof(&*weakSelf)self = weakSelf;

//弱引用
#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

//强引用
#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#define SelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#pragma mark - 读取Image
// 建议使用前一种宏定义,性能高于后者
// 读取本地图片
#define ImageWithContentsOfFile(A,T) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:T]]
#define ImageWithContentsOfFileDefault(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@2x",name] ofType:@"png"]]
// 读取图片（带缓存）
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]
#define ImageColor(name) [UIColor colorWithPatternImage:ImageWithContentsOfFileDefault(name)]


#pragma mark - GCD
#define GCD_ASYNC(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCD_MAIN_ASYNC(block) dispatch_async(dispatch_get_main_queue(),block)
#define GCD_BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCD_MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#define GCD_ONCE(block) static dispatch_once_t onceToken;\
dispatch_once(&onceToken, block)

#define GCD_DELAY(seconds,block) dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC));\
dispatch_after(popTime, dispatch_get_main_queue(), block);


#pragma mark - CLASS
#define CLASSFromNSString(className)   NSClassFromString(className)
#define CLASSINITWithString(className) [[CLASSFromNSString(className) alloc] init]


#pragma mark - Log
//输出frame(frame是结构体，没法%@)
#define LOGFRAME(f) NSLog(@"\nx:%f\ny:%f\nwidth:%f\nheight:%f\n",f.origin.x,f.origin.y,f.size.width,f.size.height)


#pragma mark - Other
//是否刻意拨打电话
#define CanCallTel(phoneNumber) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])
//拨打电话
#define CallPhoneNum(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])
#define CallPhoneNumPrompt(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])
//引导用户评价APP
#define APPSTORE_GuideUserIntoEvaluateAPP [[UIApplication sharedApplication] openURL:[NSURL URLWithString:Address_APPStore]]
//是否存在URL
#define canOpenURL(appScheme) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]])
//打开URL
#define openURL(appScheme) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]])

//解析字典时服务器数据异常处理
#define NotNull_string(key) [dic objectForKey:key] != [NSNull null] ? [dic objectForKey:key] : @""
#define NotNull_number(key) [dic objectForKey:key] != [NSNull null] ? [dic objectForKey:key] : @"0"



#endif /* LPCFunctionDefine_h */
