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


#endif /* LPCColorDefine_h */
