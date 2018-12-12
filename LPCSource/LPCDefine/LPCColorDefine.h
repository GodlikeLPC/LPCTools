//
//  LPCColorDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCColorDefine_h
#define LPCColorDefine_h


//RGB
#define COLOR_RGB(r,g,b)                 [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define COLOR_RGBA(r,g,b,a)              [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//RGB颜色转换（16进制->10进制）
#define COLOR_FFFFFF(rgbValue)           [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//根据图片取颜色
#define COLOR_Image(name)                [UIColor colorWithPatternImage:ImageWithContentsOfFileDefault(name)]

//随机一个颜色
#define COLOR_Random                     [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
//白色
#define COLOR_White                      [UIColor whiteColor]
//透明色
#define COLOR_Clear                      [UIColor clearColor]


#pragma mark - 财经观察
//股票红
#define COLOR_RED_Shares                 COLOR_FFFFFF(0xe93129)
//股票绿
#define COLOR_GREEN_Shares               COLOR_FFFFFF(0x0db430)
//标题黑
#define COLOR_BLACK_Title                COLOR_FFFFFF(0x333333)
//描述黑
#define COLOR_BLACK_Subtitle             COLOR_FFFFFF(0x333333)
//tableView背景色
#define COLOR_Background_TableView       ColorWhite


#pragma mark - SQShopping 精购
#define COLOR_StatusBar_Home             RGBACOLOR(0, 0, 0, 0.07)
#define COLOR_Black_Content              COLOR_FFFFFF(0x999999)
#define COLOR_Black_Content_Selected     COLOR_FFFFFF(0x595959)
#define COLOR_SelectionIndicatorBoxColor COLOR_FFFFFF(0xFFFEEF)
#define COLOR_TableView_Background       COLOR_FFFFFF(0xefefef)


/**
 将16进制颜色值字符串转换为UIColor对象，颜色值兼容 '0x','0X','#'前缀的情况
 
 @param hexStr 16进制颜色值字符串
 @return UIColor对象
 */
UIKIT_STATIC_INLINE UIColor * LPCHexColor(NSString * hexStr) {
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor clearColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"0x"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:1.0f];
}


#endif /* LPCColorDefine_h */
