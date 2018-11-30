//
//  LPCTimeTool.m
//  LPCTools
//
//  Created by 李沛池 on 2018/11/30.
//

#import "LPCTimeTool.h"

@implementation LPCTimeTool

//判断当前时间是否在两个时间区间内
+ (BOOL)timeRegionByDateFormatter:(NSDateFormatter *)dateFormatter
                        startTime:(NSString *)startTime
                       expireTime:(NSString *)expireTime
{
    NSDate *today = [NSDate date];
    NSString *strToday = [dateFormatter stringFromDate:today];//将日期转换成字符串
    today = [dateFormatter dateFromString:strToday];//转换成NSDate类型。日期置为方法默认日期
    
    //startTime格式为 02:22 expireTime格式为 13:14
    NSDate *start  = [dateFormatter dateFromString:startTime];
    NSDate *expire = [dateFormatter dateFromString:expireTime];
    
    if ([today compare:start] == NSOrderedDescending &&
        [today compare:expire] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

@end
