//
//  LPCBaseViewController.h
//  LPCTools
//
//  Created by 李沛池 on 2017/12/14.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCViewController.h"
#import "LPCDefine.h"

@interface LPCBaseViewController : LPCViewController

//基类会在viewDidLoad方法中自动调用下列方法 可重写方法 无需手动调用
- (void)initData;
- (void)initUI;
- (void)configRequest; // 配置首次请求

//基类会在viewWillAppear方法中自动调用下列方法 可重写方法 无需手动调用
- (void)updateData;
- (void)updateUI;


@end
