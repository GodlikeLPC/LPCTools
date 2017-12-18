//
//  LPCTools.m
//  LPCTools
//
//  Created by 李沛池 on 2017/7/20.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCTools.h"
#import <objc/runtime.h>
#import <AFNetworking/AFNetworking.h>
#import <AVFoundation/AVFoundation.h>

@interface LPCTools ()

@end

@implementation LPCTools

#pragma mark - 重点 不可删除
//Runtime方法交换
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Class class = cls;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


#pragma mark - Custom
//只有一个取消按钮的提示框
+ (void)showAlertWithVC:(UIViewController *)vc title:(NSString *)title message:(NSString *)message cancelText:(NSString *)cancelText
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    
    [alertController addAction:cancelAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

//网络状态的实时检测
+ (BOOL)isNetWorkReachable
{
    AFNetworkReachabilityManager *afNetworkReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [afNetworkReachabilityManager startMonitoring];  //开启网络监视器；
    [afNetworkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"网络不通");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"网络通过WIFI连接");
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"网络通过无线连接");
                break;
            }
            default:
                break;
        }
    }];
    
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}

/** 打开手电筒 */
+ (void)openFlashlight
{
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    if ([captureDevice hasTorch]) {
        BOOL locked = [captureDevice lockForConfiguration:&error];
        if (locked) {
            captureDevice.torchMode = AVCaptureTorchModeOn;
            [captureDevice unlockForConfiguration];
        }
    }
}
/** 关闭手电筒 */
+ (void)closeFlashlight
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

//保存下载的文件（根据格式 array或dic）
+ (BOOL)saveFileWithFileName:(NSString *)fileName data:(id)data
{
    NSFileManager *fm = [NSFileManager defaultManager];
    //如果路径文件夹不存在 创建路径文件夹
    if(![fm fileExistsAtPath:PATH_DownloadPath]){
        [fm createDirectoryAtPath:PATH_DownloadPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //文件存放路径
    NSString *filePath = [PATH_DownloadPath stringByAppendingPathComponent:fileName];
    //如果文件已存在则覆盖
    if ([fm fileExistsAtPath:filePath]) {
        [fm removeItemAtPath:filePath error:nil];
    }
    //写入文件
    return [data writeToFile:filePath atomically:YES];
}

//根据文件名查询文件
+ (NSString *)getFileDataWithFileName:(NSString *)fileName
{
    NSString *filePath = [PATH_DownloadPath stringByAppendingPathComponent:fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    //如果文件不存在 返回Nil
    if(![fm fileExistsAtPath:filePath]) return nil;
    return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}

//转换成JSON串字符串（没有可读性）
+ (NSString *)objectToJSONString:(id)object
{
    //e.g. : [{"key":"value"},{"key":"value"}]
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
    if (data == nil) return @"";
    return  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//转换成JSON串字符串（有可读性）
+ (NSString *)objectToReadableJSONString:(id)object
{
    /*e.g. :
     [
     {
     "key" : "value"
     },
     {
     "key" : "value"
     }
     ]
     */
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    if (data == nil) return @"";
    return  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//转换成JSON数据
+ (NSData *)objectToJSONData:(id)object
{
    //e.g. : <5b0a2020 7b0a2020 2020226b 65792220 3a202276 616c7565 220a2020 7d2c0a20 207b0a20 20202022 6b657922 203a2022 76616c75 65220a20 207d0a5d>
    return [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
}


#pragma mark --------------- OLD

#pragma mark - String
//去掉空格
+ (NSString *)removeSpace:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark - View
//提示框
+ (void)showAlertWithViewController:(UIViewController *)viewController
                              title:(NSString *)title
                            message:(NSString *)message
                       leftBtnTitle:(NSString *)leftBtnTitle
                      rightBtnTitle:(NSString *)rightBtnTitle
                        actionBlock:(void(^)(BOOL isCancel))actionBlock
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    // 创建按钮
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftBtnTitle style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        actionBlock(NO);
    }];
    // 注意取消按钮只能添加一个
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:rightBtnTitle style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        actionBlock(YES);
    }];
    // 添加按钮 将按钮添加到UIAlertController对象上
    [alertController addAction:leftAction];
    [alertController addAction:cancelAction];
    //展示
    [viewController presentViewController:alertController animated:YES completion:nil];
}

//显示下载标示
- (void)openStatusNetWorkLoad:(BOOL)isLoad
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = isLoad;
}

//判断当前窗口是否含有alertView
+ (BOOL)alertViewExist
{
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        for (UIView* view in window.subviews) {
            BOOL alert = [view isKindOfClass:[UIAlertController class]];
            if (alert)
                return YES;
        }
    }
    return NO;
}


#pragma mark - Log
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

//打印IOS SDK下的字体
+ (void)enumerateFont
{
    for (NSString *familyName in [UIFont familyNames]){
        NSLog(@"font family = %@",familyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"\t  %@",fontName);
        }
    }
}


#pragma mark - Image
//设置圆角(避免离屏渲染)
+ (void)avoidOffscreen:(UIImageView *)iView image:(UIImage *)image cornerRadius:(CGFloat)cornerRadius
{
    //注意第三个选项的设置
    UIGraphicsBeginImageContextWithOptions(iView.bounds.size, NO, [UIScreen mainScreen].scale);
    //在绘制之前先裁剪出一个圆形
    [[UIBezierPath bezierPathWithRoundedRect:iView.bounds
                                cornerRadius:cornerRadius] addClip];
    //图片在设置的圆形里面进行绘制
    [image drawInRect:iView.bounds];
    //获取图片
    iView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束绘制
    UIGraphicsEndImageContext();
}

//iPhone截屏
+ (UIImage *)clipScreen:(UIView *)v size:(CGSize)size
{
    //将整个v大小的图层形式创建一张图片image
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //然后将该图片保存到图片图
//    UIImageWriteToSavedPhotosAlbum(image,self,nil,nil);
    return image;
}


#pragma mark - Time
//返回当前时间戳
+ (NSString *)nowTimeStampFromCurrentDate
{
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    long long totalMilliseconds=1000*(long long)timestamp;
    NSString *timestampStr = [NSString stringWithFormat:@"%llu",totalMilliseconds];
    
    return timestampStr;
}

//获取当前日期的指定格式
+ (NSString *)getDateWithFormatter:(NSString *)formatter
{
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    [df setDateFormat:formatter];
    return [df stringFromDate:[NSDate date]];
}


#pragma mark - 验证
//判断是否是纯汉字
+ (BOOL)isChinese:(NSString *)str
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:str];
}

//判断是否含有汉字
+ (BOOL)includeChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++)
    {
        int a =[str characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            return YES;
        }
    }
    return NO;
}

//是否是纯字母
+ (BOOL)pureLetters:(NSString*)str
{
    for(int i=0;i<str.length;i++){
        unichar c=[str characterAtIndex:i];
        if((c<'A'||c>'Z')&&(c<'a'||c>'z'))
            return NO;
    }
    return YES;
}

//验证字符串是否为纯数字
+ (BOOL)deptNumInputShouldNumber:(NSString *)str
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}

//浮点形判断
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
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

//验证邮箱是否符合基本规则
+ (BOOL)validateEmail:(NSString *)email
{
    NSString * p = @"\\w+(\\.\\w)*@\\w+(\\.\\w{1,3}){1,3}";
    NSPredicate *regextestP = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p];
    if ([regextestP evaluateWithObject:email]) {
        return YES;
    }else {
        return NO;
    }
}

//验证手机
+ (BOOL)validateMobile:(NSString *)mobileNum
{
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
    }
    else
    {
        return NO;
    }
}


#pragma mark - 稳定性
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
