//
//  LPCBaseModel.m
//  LPCTools
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCBaseModel.h"
#import <objc/runtime.h>

@implementation LPCBaseModel

+ (NSMutableArray *)modelArrayFromJSON:(NSDictionary *)dic
{
    return nil;
}

+ (NSMutableArray *)modelArrayFromJSONArray:(NSArray *)array
{
    NSMutableArray *arrayModels = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        id model = [self modelFromDic:dic];
        [arrayModels addObject:model];
    }
    return arrayModels;
}

+ (instancetype)modelFromDic:(NSDictionary *)dic
{
    return [[[self class] alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

//避免服务器传回的key本地没有导致app闪退
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

//模型转字典
- (NSMutableDictionary *)entityToDictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    // 获取类名/根据类名获取类对象
    NSString *className = NSStringFromClass([self class]);
    id classObject = objc_getClass([className UTF8String]);
    
    // 获取所有属性
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(classObject, &count);
    
    // 遍历所有属性
    for (int i = 0; i < count; i++) {
        // 取得属性
        objc_property_t property = properties[i];
        // 取得属性名
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                          encoding:NSUTF8StringEncoding];
        // 取得属性值
        id propertyValue = nil;
        id valueObject = [self valueForKey:propertyName];
        
        if ([valueObject isKindOfClass:[NSDictionary class]]) {
            propertyValue = [NSDictionary dictionaryWithDictionary:valueObject];
        } else if ([valueObject isKindOfClass:[NSArray class]]) {
            propertyValue = [NSArray arrayWithArray:valueObject];
        } else if (valueObject == nil) {
            propertyValue = @"" ;
        } else {
            propertyValue = [NSString stringWithFormat:@"%@", [self valueForKey:propertyName]];
        }
        
        [dict setObject:propertyValue forKey:propertyName];
    }
    
    return dict;
}

/*
 //避免服务器传回的数据为Number类型导致app闪退
 - (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
 {
 NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
 for (NSString *key in [keyedValues allKeys]) {
 NSString *value = [NSString stringWithFormat:@"%@",keyedValues[key]];
 [dic setValue:value forKey:key];
 }
 [super setValuesForKeysWithDictionary:dic];
 }
 */

@end
