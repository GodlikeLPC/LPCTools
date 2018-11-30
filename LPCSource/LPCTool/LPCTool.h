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


#pragma mark - 坐标转换
/**
 地球坐标 ---> 火星坐标
 */
+ (CLLocation *)transformToMars:(CLLocation *)location;


/*
 POST请求字典转为字符串格式
 */
+ (NSString *)strRequestWithDictionary:(NSDictionary *)dict;

@end
