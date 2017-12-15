//
//  NSBundle+LPCLoadResource.m
//  LPCToolsDemo
//
//  Created by 李沛池 on 2017/12/15.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "NSBundle+LPCLoadResource.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSBundle (LPCLoadResource)

+ (void)load
{
    Method originMethod = class_getInstanceMethod(self, @selector(pathForResource:ofType:));
    Method newMethod = class_getInstanceMethod(self, @selector(tempPathForResource:ofType:));
    method_exchangeImplementations(originMethod, newMethod);
}

- (NSString *)tempPathForResource:(NSString *)name ofType:(NSString *)type
{
    NSString *path = [self tempPathForResource:name ofType:type];
    if (path) {
        return path;
    }
    CGFloat scale = [UIScreen mainScreen].scale;
    if (ABS(scale-3) <= 0.001) {
        path = [self tempPathForResource_3x:name ofType:type];
        if (!path) {
            path = [self tempPathForResource_2x:name ofType:type];
            if (!path) {
                path = [self tempPathForResource_x:name ofType:type];
            }
        }
        
    }
    else if (ABS(scale-2) <= 0.001){
        path = [self tempPathForResource_2x:name ofType:type];
        if (!path) {
            path = [self tempPathForResource_3x:name ofType:type];
            if (!path) {
                path = [self tempPathForResource_x:name ofType:type];
            }
        }
    }
    else {
        path = [self tempPathForResource_x:name ofType:type];
        if (!path) {
            path = [self tempPathForResource_2x:name ofType:type];
            if (!path) {
                path = [self tempPathForResource_3x:name ofType:type];
            }
        }
    }
    
    return path;
}

- (NSString *)tempPathForResource_x:(NSString *)name ofType:(NSString *)type
{
    NSString *path = nil;
    NSString *teampName = nil;
    
    if ([name hasSuffix:@"@3x"]) {
        teampName = [name stringByReplacingOccurrencesOfString:@"@3x" withString:@""];
    }
    else if ([name hasSuffix:@"@2x"]) {
        teampName = [name stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
    }
    else {
        teampName = name;
    }
    path = [self tempPathForResource:teampName ofType:type];
    
    return path;
}

- (NSString *)tempPathForResource_2x:(NSString *)name ofType:(NSString *)type
{
    NSString *path = nil;
    NSString *teampName = nil;
    
    if ([name hasSuffix:@"@3x"]) {
        teampName = [name stringByReplacingOccurrencesOfString:@"@3x" withString:@"@2x"];
    }
    else if ([name hasSuffix:@"@2x"]) {
        teampName = name;
    }
    else {
        teampName = [NSString stringWithFormat:@"%@@2x", name];
    }
    path = [self tempPathForResource:teampName ofType:type];
    
    return path;
}

- (NSString *)tempPathForResource_3x:(NSString *)name ofType:(NSString *)type
{
    NSString *path = nil;
    NSString *teampName = nil;
    
    if ([name hasSuffix:@"@3x"]) {
        teampName = name;
    }
    else if ([name hasSuffix:@"@2x"]) {
        teampName = [name stringByReplacingOccurrencesOfString:@"@2x" withString:@"@3x"];
    }
    else {
        teampName = [NSString stringWithFormat:@"%@@3x", name];
    }
    path = [self tempPathForResource:teampName ofType:type];
    
    return path;
}


@end
