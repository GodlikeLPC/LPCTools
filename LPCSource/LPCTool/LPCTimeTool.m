//
//  LPCTimeTool.m
//  LPCTools
//
//  Created by 李沛池 on 2018/11/30.
//

#import "LPCTimeTool.h"

#ifndef TIME_Format_yMd_Default
#define TIME_Format_yMd_Default     @"yyyy-MM-dd"
#endif

#ifndef TIME_Format_yMdHms_Default
#define TIME_Format_yMdHms_Default  @"yyyy-MM-dd HH:mm:ss"
#endif

@implementation LPCTimeTool
#pragma mark - 基础方法
//将字符串转化为时间
+ (NSDate *)stringToDate:(NSString *)strDate dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:dateFormat];
    NSDate *returnDate = [df dateFromString:strDate];
    return returnDate;
}

//将日期转化为字符串
+ (NSString *)dateToString:(NSDate *)date dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:dateFormat];
    NSString *returnDate = [df stringFromDate:date];
    return returnDate;
}

//获取当前date的字符串格式
+ (NSString *)getDateStrFromDateFormat:(NSString *)dateFormat
{
    NSString *strToday = [self dateToString:[NSDate date] dateFormat:dateFormat];
    return strToday;
}


#pragma mark - 业务方法
//返回当前时间戳
+ (long long)nowTimeStampFromCurrentDate
{
    return [[NSDate date] timeIntervalSince1970];
}

//返回传入时间的时间戳字符串
+ (NSString *)getDateStampFromDate:(NSDate *)date
{
    NSTimeInterval timestamp = [date timeIntervalSince1970];
    long long totalMilliseconds = 1000*(long long)timestamp;
    NSString *timestampStr = [NSString stringWithFormat:@"%llu",totalMilliseconds];
    
    return timestampStr;
}

//根据时间戳格式化日期字符串
+ (NSString *)getDateStrFromDateStamp:(long long)dateStamp
{
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:dateStamp/1000];
    NSString *returnStr = [self dateToString:dateFrom dateFormat:TIME_Format_yMd_Default];
    return returnStr;
}

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

//no是白天 yes是黑天
+ (BOOL)dayOrNight
{
    //获取到当天的小时
    NSString *strToday = [self getDateStrFromDateFormat:@"HH"];
    NSInteger hourToday = [strToday integerValue];
    BOOL isNight = ((hourToday >= 6) && (hourToday <= 17)) ? NO : YES;
    return isNight;
}

//计算日期和今天 相差天数
+ (NSUInteger)getDateDaysDiff:(NSDate *)date
{
    NSDate *fromDate = [[NSDate alloc] init];
    NSDate *toDate   = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:2];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:date];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate   interval:NULL forDate:[NSDate date]];
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    return dayComponents.day;
}

//计算某一天距离今天多少天，多少小时，多少分钟
+ (NSArray<NSNumber *> *)intervalSinceNow:(NSString *)theDate
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:TIME_Format_yMdHms_Default];
    NSDate *fromdate = [format dateFromString:theDate];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate:fromdate];
    NSDate *fromDate = [fromdate dateByAddingTimeInterval:frominterval];
    
    //获取当前时间
    NSDate *adate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:adate];
    NSDate *localeDate = [adate dateByAddingTimeInterval:interval];
    
    double intervalTime = [fromDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    long lTime = abs((long)intervalTime);
    
    NSInteger iDays = lTime/60/60/24;
    NSInteger iHours = abs(lTime/3600)-iDays*24;
    NSInteger iMinutes = (lTime / 60) % 60;
    
    NSArray *arrayReturn = @[@(iDays),@(iHours),@(iMinutes)];
    return arrayReturn;
}

@end
