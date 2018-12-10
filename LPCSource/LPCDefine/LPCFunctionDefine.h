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
#define STRINGFROMNUM(num)       [NSString stringWithFormat:@"%@",@(num)]
//字符串转url
#define URLString(str)           [NSURL URLWithString:str]
//打印结构体
#define LOGFRAME(f)              LPCLog(@"\nx:%f\ny:%f\nwidth:%f\nheight:%f\n",f.origin.x,f.origin.y,f.size.width,f.size.height)

//解析字典时服务器数据异常处理
#define NotNull_string(key)      [dic objectForKey:key] != [NSNull null] ? [dic objectForKey:key] : @""
#define NotNull_number(key)      [dic objectForKey:key] != [NSNull null] ? [dic objectForKey:key] : @"0"

//是否存在URL
#define CANOpenURL(appScheme)    [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]]
//打开URL
#define OPENURL(appScheme)       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]]

/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

//更方便的使用强弱引用
#define LPCCreateWeakSelf   __weak   __typeof(&*self)weakSelf = self;
#define LPCCreateStrongSelf __strong __typeof(&*weakSelf)self = weakSelf;


#pragma mark - 读取Image
// 建议使用前一种宏定义,性能高于后者
// 读取本地图片
#define ImageWithContentsOfFile(A,T)                   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:T]]
#define ImageWithContentsOfFileDefault(name)           [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@2x",name] ofType:@"png"]]
// 读取图片（带缓存）
#define ImageNamed(name)                               [UIImage imageNamed:name]


#pragma mark - GCD
#define GCD_ASYNC(block)                               dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCD_MAIN_ASYNC(block)                          dispatch_async(dispatch_get_main_queue(),block)
#define GCD_BACK(block)                                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCD_MAIN(block)                                dispatch_async(dispatch_get_main_queue(),^{block});
#define GCD_ONCE(block) static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{block});
#define GCD_DELAY(seconds,block) dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC));\
dispatch_after(popTime, dispatch_get_main_queue(), block);


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


#pragma mark - ViewController
//获取当前主视图
#define ROOTVC_CurrentVC                               [UIApplication sharedApplication].keyWindow.rootViewController
#define ROOTVC_CurrentNav                              [UIApplication sharedApplication].keyWindow.rootViewController.navigationController

//从self跳转到ViewController
#define PushToVC(vcStr)                                [self.navigationController pushViewController:[[NSClassFromString(vcStr) alloc] init] animated:YES];
#define PushToNibVC(vcStr)                             [self.navigationController pushViewController:[[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil] animated:YES];
#define PresentToVC(vcStr,animate)                     [self presentViewController:[[NSClassFromString(vcStr) alloc] init] animated:animate completion:nil];
#define PresentToNibVC(vcStr)                          [self presentViewController:[[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil] animated:YES completion:nil];
#define PushToNibVCFromTabBar(vcStr)                   [self.tabBarController.navigationController pushViewController:[[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil] animated:YES];
#define PushToNibVCFromTabBarWithNoAnimated(vcStr)     [self.tabBarController.navigationController pushViewController:[[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil] animated:NO];

//返回
#define PopVC                                          [self.navigationController popViewControllerAnimated:YES];
#define DissmissVC                                     [self dismissViewControllerAnimated:YES completion:nil];

//注册并复用自定义cell文件
#define XIBcellWithName(name) [tableView registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:name];\
cell = [tableView dequeueReusableCellWithIdentifier:name];

//读取xib文件
#define XIBVCInit(name)                                [[NSClassFromString(name) alloc] initWithNibName:name bundle:nil]
#define XIBFromMainBundle(name)                        [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] objectAtIndex:0]
//注册xibCell
#define XIBRegister(name)                              registerNib:[UINib nibWithNibName:name bundle:nil] forCellWithReuseIdentifier:name
//注册无XIB的cell
#define ClassRegister(name)                            registerClass:[NSClassFromString(name) class] forCellWithReuseIdentifier:name
//从storyboard中读取
#define StoryboardXIIBVC(identifier)                   [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:identifier]


#endif /* LPCFunctionDefine_h */
