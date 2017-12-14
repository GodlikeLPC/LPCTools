//
//  LPCGestureUnlockViewController.h
//  LPCTools
//
//  Created by Godlike on 2017/12/13.
//  Copyright © 2017年 jd. All rights reserved.
//

#import "LPCBaseViewController.h"

typedef NS_ENUM(NSInteger,WUUnlockType) {
    LPCUnlockTypeCreatePwd,//创建手势密码
    LPCUnlockTypeValidatePwd//校验手势密码
};

@interface LPCGesturesUnlockViewController : LPCBaseViewController

+ (void)deleteGesturesPassword;//删除手势密码
+ (NSString *)gesturesPassword;//获取手势密码

- (instancetype)initWithUnlockType:(WUUnlockType)unlockType;

@end
