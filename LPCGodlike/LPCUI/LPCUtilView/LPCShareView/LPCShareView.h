//
//  LPCShareView.h
//  LPCTools
//
//  Created by 李沛池 on 2017/8/7.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCBaseView.h"

@interface LPCShareView : LPCBaseView

+ (void)showInWindow:(void (^)(SharePlatformType type))selectShareTypeBlock;

@end
