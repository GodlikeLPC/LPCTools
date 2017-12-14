//
//  LPCBaseView.h
//  LPCTools
//
//  Created by 李沛池 on 2017/12/14.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCView.h"
#import "LPCDefine.h"


typedef void (^LPCBaseViewBlock)(id);

@interface LPCBaseView : LPCView

@property (nonatomic, strong) NSString *viewTag; //标签(用来区分特殊的View)

@property (nonatomic, assign) id obj; //传递的对象

@property (nonatomic, copy) LPCBaseViewBlock bvBlock;

- (void)initData;
- (void)initUI;

- (void)updateData:(id)item;

//寻找view所属的viewController
- (UIViewController*)viewController;


@end
