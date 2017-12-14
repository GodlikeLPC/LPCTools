//
//  LPCBaseModel.h
//  LPCTools
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCObject.h"

@interface LPCBaseModel : LPCObject

/**
 从JSON中解析成模型数组
 
 @param dic JSON信息
 @return 模型数组
 */
+ (NSMutableArray *)modelArrayFromJSON:(NSDictionary *)dic;

/**
 从Array中解析成模型数组
 
 @param array JSON信息Array形式
 @return 模型数组
 */
+ (NSMutableArray *)modelArrayFromJSONArray:(NSArray *)array;

//从字典中解析模型
+ (instancetype)modelFromDic:(NSDictionary *)dic;

//从字典初始化模型
- (instancetype)initWithDic:(NSDictionary *)dic;

/**
 * 模型转字典
 */
- (NSMutableDictionary *)entityToDictionary;


@end
