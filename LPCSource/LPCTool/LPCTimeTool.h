//
//  LPCTimeTool.h
//  LPCTools
//
//  Created by 李沛池 on 2018/11/30.
//

#import <Foundation/Foundation.h>

/**
 时间相关方法
 */
@interface LPCTimeTool : NSObject

/**
 判断当前时间是否在两个时间区间内

 @param startTime 开始时间
 @param expireTime 结束时间
 @return 是否在这个区间
 */
+ (BOOL)judgeTimeByStartAndEnd:(NSString *)startTime withExpireTime:(NSString *)expireTime;

@end
