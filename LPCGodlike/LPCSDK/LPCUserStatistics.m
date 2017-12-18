//
//  LPCUserStatistics.m
//  LPCToolsDemo
//
//  Created by 李沛池 on 2017/12/18.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCUserStatistics.h"

@implementation LPCUserStatistics

/**
 *  初始化配置，一般在launchWithOption中调用
 */
+ (void)configure
{
    
}

+ (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:FILENAME_UserStatistics ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}


#pragma mark -- 页面统计部分

+ (void)enterPageViewWithPageID:(NSString *)pageID
{
    //进入页面
    NSLog(@"***模拟发送[进入页面]事件给服务端，页面ID:%@", pageID);
}

+ (void)leavePageViewWithPageID:(NSString *)pageID
{
    //离开页面
    NSLog(@"***模拟发送[离开页面]事件给服务端，页面ID:%@", pageID);
}


#pragma mark -- 自定义事件统计部分
+ (void)sendEventToServer:(NSString *)eventId
{
    //在这里发送event统计信息给服务端
    NSLog(@"***模拟发送统计事件给服务端，事件ID: %@", eventId);
}


@end
