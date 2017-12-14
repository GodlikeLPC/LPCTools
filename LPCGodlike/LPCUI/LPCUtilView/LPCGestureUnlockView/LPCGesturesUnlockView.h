//
//  LPCGesturesLockView.h
//  LPCTools
//
//  Created by Godlike on 2017/12/13.
//  Copyright © 2017年 jd. All rights reserved.
//

#import "LPCBaseView.h"

@class LPCGesturesUnlockView;

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

@protocol LPCGesturesUnlockViewDelegate <NSObject>

- (void)gesturesUnlockView:(LPCGesturesUnlockView *)unlockView drawRectFinished:(NSMutableString *)gesturePassword;

@end

@interface LPCGesturesUnlockView : LPCBaseView

@property (nonatomic,weak) id<LPCGesturesUnlockViewDelegate> delegate;

@end
