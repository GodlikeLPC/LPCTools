//
//  NSMutableSet+LPCTools.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/12.
//

#import "NSMutableSet+LPCTools.h"

@implementation NSMutableSet (LPCTools)

+ (void)load
{
    MethodSwizzle_lpc(self, @selector(addObject:), @selector(addObject_lpc:));
}

- (void)addObject_lpc:(id)object
{
    if (object) {
        [self addObject_lpc:object];
    } else {
        NSCAssert(0, @"❌❌❌❌❌❌❌addObject:参数不是对象或为nil");
    }
}

@end
