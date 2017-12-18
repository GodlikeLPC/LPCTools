//
//  LPCUserStatistics.h
//  LPCToolsDemo
//
//  Created by 李沛池 on 2017/12/18.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCObject.h"

/**
 自动化埋点
 */
@interface LPCUserStatistics : LPCObject

/**
 *  初始化配置，一般在launchWithOption中调用
 */
+ (void)configure;

+ (void)enterPageViewWithPageID:(NSString *)pageID;

+ (void)leavePageViewWithPageID:(NSString *)pageID;

+ (void)sendEventToServer:(NSString *)eventId;


@end
