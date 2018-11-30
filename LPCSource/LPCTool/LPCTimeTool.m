//
//  LPCTimeTool.m
//  LPCTools
//
//  Created by 李沛池 on 2018/11/30.
//

#import "LPCTimeTool.h"

@implementation LPCTimeTool

//判断当前时间是否在两个时间区间内
+ (BOOL)judgeTimeByStartAndEnd:(NSString *)startTime withExpireTime:(NSString *)expireTime
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //时间格式,建议时间HH大写,手机24小时进制和12小时禁止都可以完美格式化
    [dateFormat setDateFormat:@"HH:mm"];
    NSString *strToday = [dateFormat stringFromDate:today];//将日期转换成字符串
    today = [dateFormat dateFromString:strToday];//转换成NSDate类型。日期置为方法默认日期
    //startTime格式为 02:22 expireTime格式为 13:14
    NSDate *start  = [dateFormat dateFromString:startTime];
    NSDate *expire = [dateFormat dateFromString:expireTime];
    
    if ([today compare:start] == NSOrderedDescending &&
        [today compare:expire] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

@end
