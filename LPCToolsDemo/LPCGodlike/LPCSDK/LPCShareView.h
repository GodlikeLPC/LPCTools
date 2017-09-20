//
//  LPCShareView.h
//  EverydayNews
//
//  Created by 李沛池 on 2017/8/7.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCUIView.h"
#import "LPCDefine.h"

@interface LPCShareView : LPCUIView

+ (void)showInWindow:(void (^)(SharePlatformType type))selectShareTypeBlock;

@end
