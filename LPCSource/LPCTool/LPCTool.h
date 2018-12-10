//
//  LPCTool.h
//  LPCTool
//
//  Created by 李沛池 on 2018/11/29.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface LPCTool : NSObject

/**
 操作手电筒：打开、关闭

 @param isOpen 要打开还是关闭
 */
+ (void)operateFlashlight:(BOOL)isOpen;

/**
 获取对象下的所有属性和属性内容
 */
+ (NSDictionary *)getModelAllAttr:(id)obj;

/*
 POST请求字典转为字符串格式
 */
+ (NSString *)strRequestWithDictionary:(NSDictionary *)dict;

/**
 颜色值生成图片
 */
+ (UIImage*)imageWithColor:(UIColor*)color andSize:(CGSize)size;

/**
 iPhone截屏
 */
+ (UIImage *)clipScreen:(UIView *)view size:(CGSize)size;


#pragma mark - 坐标转换
/**
 地球坐标 ---> 火星坐标
 */
+ (CLLocation *)transformToMars:(CLLocation *)location;




#pragma mark - OpenFoundation
/**
 打开mail
 */
+ (void)openEmail:(NSString *)strDetails;
/**
 拨打电话
 */
+ (void)openPhone:(NSString *)strDetails;
/**
 打开短信
 */
+ (void)openSms:(NSString *)strDetails;
/**
 打开浏览器
 */
+ (void)openBrower:(NSString *)strDetails;
/**
 显示下载标示
 */
- (void)openStatusNetWorkLoad:(BOOL)isLoad;


#pragma mark - Validate
/**
 验证手机
 */
+ (BOOL)validateMobile:(NSString *)mobileNum;
/**
 验证邮箱是否符合基本规则
 */
+ (BOOL)validateEmail:(NSString *)email;
/**
 浮点形判断
 */
+ (BOOL)isPureFloat:(NSString *)string;
/**
 判断字符串是否全为数字
 */
+ (BOOL)isPureInt:(NSString*)string;
/**
 判断字符串是否有效
 */
+ (BOOL)stringIsValid:(NSString *)string;
/**
 替换非UTF8字符
 */
+ (NSData *)replaceNoUtf8:(NSData *)data;

@end
