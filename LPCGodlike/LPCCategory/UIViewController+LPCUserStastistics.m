//
//  UIViewController+LPCUserStastistics.m
//  LPCToolsDemo
//
//  Created by 李沛池 on 2017/12/18.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "UIViewController+LPCUserStastistics.h"
#import "LPCTools.h"
#import "LPCUserStatistics.h"

@implementation UIViewController (LPCUserStastistics)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(swiz_viewWillAppear:);
        [LPCTools swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
        
        SEL originalSelector2 = @selector(viewWillDisappear:);
        SEL swizzledSelector2 = @selector(swiz_viewWillDisappear:);
        [LPCTools swizzlingInClass:[self class] originalSelector:originalSelector2 swizzledSelector:swizzledSelector2];
    });
}

#pragma mark - Method Swizzling

- (void)swiz_viewWillAppear:(BOOL)animated
{
    //插入需要执行的代码
    [self inject_viewWillAppear];
    [self swiz_viewWillAppear:animated];
}

- (void)swiz_viewWillDisappear:(BOOL)animated
{
    [self inject_viewWillDisappear];
    [self swiz_viewWillDisappear:animated];
}

//利用hook 统计所有页面的停留时长
- (void)inject_viewWillAppear
{
    NSString *pageID = [self pageEventID:YES];
    if (pageID) {
        [LPCUserStatistics sendEventToServer:pageID];
    }
}

- (void)inject_viewWillDisappear
{
    NSString *pageID = [self pageEventID:NO];
    if (pageID) {
        [LPCUserStatistics sendEventToServer:pageID];
    }
}

- (NSString *)pageEventID:(BOOL)bEnterPage
{
    NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEventIDs"][bEnterPage ? @"Enter" : @"Leave"];
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:FILENAME_UserStatistics ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}


@end
