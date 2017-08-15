//
//  LPCTools.m
//  EverydayNews
//
//  Created by 李沛池 on 2017/7/20.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCTools.h"

@interface LPCTools ()

@end

@implementation LPCTools


#pragma mark - String
//去掉空格
+ (NSString *)removeSpace:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}



@end
