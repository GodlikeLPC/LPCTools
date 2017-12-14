//
//  LPCErrorCodeView.h
//  LPCTools
//
//  Created by 李沛池 on 2017/12/6.
//  Copyright © 2017年 jd. All rights reserved.
//

#import "LPCBaseView.h"

//错误代码的展示形式
typedef NS_ENUM(NSInteger, ErrorcodeShowType)
{
    ErrorcodeShowType_Unknow = 0,     //返回
    ErrorcodeShowType_Back = 101,     //返回
    ErrorcodeShowType_BackLastpage, //返回上一页
    ErrorcodeShowType_BackHomepage, //返回主页
    ErrorcodeShowType_Refresh,      //刷新
    ErrorcodeShowType_Reload,       //重新加载
};

/**
 服务器错误代码通用View
 */
@interface LPCErrorcodeView : LPCBaseView

//使用kCreateWeakSelf、kCreateStrongSelf避免循环引用
@property (nonatomic, copy) void(^backBlock)(NSString *title);    //返回功能block
@property (nonatomic, copy) void(^reloadBlock)(NSString *title);  //重载功能block
@property (nonatomic, copy) void(^refreshBlock)(NSString *title); //刷新功能block

//展示服务器错误代码通用View
+ (void)showInView:(UIView *)superView
         errorcode:(NSInteger)errorcode
         backBlock:(void(^)(NSString *title))backBlock
       reloadBlock:(void(^)(NSString *title))reloadBlock
      refreshBlock:(void(^)(NSString *title))refreshBlock;

@end
