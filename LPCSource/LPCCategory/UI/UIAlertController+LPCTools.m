//
//  UIAlertController+LPCTools.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "UIAlertController+LPCTools.h"

@implementation UIAlertController (LPCTools)

//解决：横屏时使用UIAlertController会导致错误
- (BOOL)shouldAutorotate
{
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        return NO;
    }
    return YES;
}

@end
