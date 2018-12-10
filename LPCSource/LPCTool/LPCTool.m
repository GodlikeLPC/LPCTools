//
//  LPCTool.m
//  LPCTool
//
//  Created by 李沛池 on 2018/11/29.
//

#import "LPCTool.h"
#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>

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

//获取对象下的所有属性和属性内容
+ (NSDictionary *)getModelAllAttr:(id)obj
{
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([obj class], &outCount);
    for (i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [obj valueForKey:(NSString *)propertyName];
        if (propertyValue) [d setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return d;
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

//颜色值生成图片
+ (UIImage*)imageWithColor:(UIColor*)color andSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage*theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

//iPhone截屏
+ (UIImage *)clipScreen:(UIView *)view size:(CGSize)size
{
    //将整个v大小的图层形式创建一张图片image
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //然后将该图片保存到图片图
    //    UIImageWriteToSavedPhotosAlbum(image,self,nil,nil);
    return image;
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


#pragma mark - OpenFoundation
//打开系统功能
+ (void)openFoundation:(NSString *)strFoundation strDetails:(NSString *)strDetails
{
    NSString *strOpenURL = [NSString stringWithFormat:@"%@://%@",strFoundation ,strDetails];
    OPENURL(strOpenURL);
}

//打开mail
+ (void)openEmail:(NSString *)strDetails
{
    [self openFoundation:@"mailto" strDetails:strDetails];
}
//拨打电话
+ (void)openPhone:(NSString *)strDetails
{
    [self openFoundation:@"tel" strDetails:strDetails];
}
//打开短信
+ (void)openSms:(NSString *)strDetails
{
    [self openFoundation:@"sms" strDetails:strDetails];
}
//打开浏览器
+ (void)openBrower:(NSString *)strDetails
{
    [self openFoundation:@"http" strDetails:strDetails];
}
//显示下载标示
- (void)openStatusNetWorkLoad:(BOOL)isLoad
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = isLoad;
}


#pragma mark - Validate
//验证手机
+ (BOOL)validateMobile:(NSString *)mobileNum
{
    if ([mobileNum hasPrefix:@"+86"]) {
        mobileNum=[mobileNum substringWithRange:NSMakeRange(3, mobileNum.length-3)];
    }
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     //    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
     */
    NSString * MOBILE = @"^1[0-9]{10}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }else {
        return NO;
    }
}

//验证邮箱是否符合基本规则
+ (BOOL)validateEmail:(NSString *)email
{
    //    NSString * p = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString * p = @"\\w+(\\.\\w)*@\\w+(\\.\\w{1,3}){1,3}";
    NSPredicate *regextestP = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p];
    if ([regextestP evaluateWithObject:email]) {
        return YES;
    }else {
        return NO;
    }
}

//浮点形判断
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

//判断字符串是否全为数字
+ (BOOL)isPureInt:(NSString*)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断字符串是否有效
+ (BOOL)stringIsValid:(NSString *)string
{
    if( string == nil ||
       [string isEqualToString:@""] ||
       [string isEqualToString:@"(null)"] ||
       [string isKindOfClass:[NSNull class]]) {
        return NO;
    }
    return YES;
}

//替换非UTF8字符
//注意：如果是三字节utf-8，第二字节错误，则先替换第一字节内容(认为此字节误码为三字节utf8的头)，然后判断剩下的两个字节是否非法；
+ (NSData *)replaceNoUtf8:(NSData *)data
{
    char aa[] = {'A','A','A','A','A','A'};                      //utf8最多6个字符，当前方法未使用
    NSMutableData *md = [NSMutableData dataWithData:data];
    int loc = 0;
    while(loc < [md length])
    {
        char buffer;
        [md getBytes:&buffer range:NSMakeRange(loc, 1)];
        if((buffer & 0x80) == 0)
        {
            loc++;
            continue;
        }
        else if((buffer & 0xE0) == 0xC0)
        {
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                continue;
            }
            loc--;
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
        else if((buffer & 0xF0) == 0xE0)
        {
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                [md getBytes:&buffer range:NSMakeRange(loc, 1)];
                if((buffer & 0xC0) == 0x80)
                {
                    loc++;
                    continue;
                }
                loc--;
            }
            loc--;
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
        else
        {
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
    }
    
    return md;
}

@end
