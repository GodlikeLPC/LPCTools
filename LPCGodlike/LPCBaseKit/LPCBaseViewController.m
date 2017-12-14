//
//  LPCBaseViewController.m
//  LPCTools
//
//  Created by 李沛池 on 2017/12/14.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCBaseViewController.h"
//#import "MTA.h"

@interface LPCBaseViewController ()

@end

@implementation LPCBaseViewController

- (void)dealloc
{
    NSLog(@"LPC_deallocClass : %@",[self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化数据
    [self initData];
    //初始化UI
    [self initUI];
    //配置首次请求
    [self configRequest];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [MTA trackPageViewBegin:NSStringFromClass([self class])];
    //更新数据
    [self updateData];
    //更新UI
    [self updateUI];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    [MTA trackPageViewEnd:NSStringFromClass([self class])];
}


#pragma mark - INIT 初始化
- (void)initData
{
    
}

- (void)initUI
{
    
}

- (void)configRequest
{
    
}


#pragma mark - UPDATE 更新
- (void)updateData
{
    
}
- (void)updateUI
{
    
}

@end
