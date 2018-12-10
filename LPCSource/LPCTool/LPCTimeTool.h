//
//  LPCTimeTool.h
//  LPCTools
//
//  Created by 李沛池 on 2018/11/30.
//

#import <Foundation/Foundation.h>

/**
 时间相关方法
 */
@interface LPCTimeTool : NSObject

/*
 返回当前时间戳
 */
+ (long long)nowTimeStampFromCurrentDate;

/*
 根据时间戳格式化日期字符串
 */
+ (NSString *)getDateStrFromDateStamp:(long long)dateStamp;

/**
 判断当前时间是否在两个时间区间内

 @param dateFormatter 开始结束时间的日期格式 eg: @"HH:mm"
 @param startTime 开始时间
 @param expireTime 结束时间
 @return 是否在这个区间
 */
+ (BOOL)timeRegionByDateFormatter:(NSDateFormatter *)dateFormatter
                        startTime:(NSString *)startTime
                       expireTime:(NSString *)expireTime;

/**
 no是白天 yes是黑天
 */
+ (BOOL)dayOrNight;

/**
 计算日期和今天 相差天数
 */
+ (NSUInteger)getDateDaysDiff:(NSDate *)date;

@end
