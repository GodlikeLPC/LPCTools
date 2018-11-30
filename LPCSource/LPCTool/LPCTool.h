//
//  LPCTool.h
//  LPCTool
//
//  Created by 李沛池 on 2018/11/29.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface LPCTool : NSObject


#pragma mark - 坐标转换
/**
 地球坐标 ---> 火星坐标
 */
+ (CLLocation *)transformToMars:(CLLocation *)location;


@end
