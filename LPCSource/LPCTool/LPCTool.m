//
//  LPCTool.m
//  LPCTool
//
//  Created by 李沛池 on 2018/11/29.
//

#import "LPCTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation LPCTool

//操作手电筒：打开、关闭
+ (void)operateFlashlight:(BOOL)isOpen
{
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([captureDevice hasTorch]) {
        if ([captureDevice lockForConfiguration:nil]) {
            captureDevice.torchMode = isOpen?AVCaptureTorchModeOn:AVCaptureTorchModeOff;
            [captureDevice unlockForConfiguration];
        }
    }
}


#pragma mark - Location
//地球坐标 ---> 火星坐标
const double a = 6378245.0;
const double ee = 0.00669342162296594323;
+ (CLLocation *)transformToMars:(CLLocation *)location
{
    //是否在中国大陆之外
    if ([[self class] outOfChina:location]) {
        return location;
    }
    double dLat = [[self class] transformLatWithX:location.coordinate.longitude - 105.0 y:location.coordinate.latitude - 35.0];
    double dLon = [[self class] transformLonWithX:location.coordinate.longitude - 105.0 y:location.coordinate.latitude - 35.0];
    double radLat = location.coordinate.latitude / 180.0 * M_PI;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * M_PI);
    return [[CLLocation alloc] initWithLatitude:location.coordinate.latitude + dLat longitude:location.coordinate.longitude + dLon];
}

+ (BOOL)outOfChina:(CLLocation *)location
{
    if (location.coordinate.longitude < 72.004 || location.coordinate.longitude > 137.8347) {
        return YES;
    }
    if (location.coordinate.latitude < 0.8293 || location.coordinate.latitude > 55.8271) {
        return YES;
    }
    return NO;
}

+ (double)transformLatWithX:(double)x y:(double)y
{
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * M_PI) + 40.0 * sin(y / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * M_PI) + 320 * sin(y * M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

+ (double)transformLonWithX:(double)x y:(double)y
{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * M_PI) + 300.0 * sin(x / 30.0 * M_PI)) * 2.0 / 3.0;
    return ret;
}


//POST请求字典转为字符串格式
+ (NSString *)strRequestWithDictionary:(NSDictionary *)dict
{
    if (dict == nil || dict.allKeys.count == 0) {
        return @"";
    }
    NSMutableString *strReturn = [[NSMutableString alloc] init];
    
    for (NSString *strKey in [dict allKeys]) {
        [strReturn appendString:@"&"];
        [strReturn appendString:strKey];
        [strReturn appendString:@"="];
        [strReturn appendFormat:@"%@",dict[strKey]];
    }
    
    if (strReturn.length > 0) {
        [strReturn replaceCharactersInRange:NSMakeRange(0, 1) withString:@"?"];
    }
    
    return strReturn;
}

//打开mail
+ (void)openEmail:(NSString *)s {
//    OPENURL([NSString stringWithFormat:@"mailto://%@",s]);
}
//拨打电话
+ (void)openPhone:(NSString *)s {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto://%@",s]]];
//    OPENURL(<#appScheme#>)
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",s]]];
}
//打开短信
+ (void)openSms:(NSString *)s {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",s]]];
}
//打开浏览器
+ (void)openBrower:(NSString *)s {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",s]]];
}



@end
