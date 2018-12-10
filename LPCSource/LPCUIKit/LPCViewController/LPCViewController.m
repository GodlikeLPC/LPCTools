//
//  LPCViewController.m
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import "LPCViewController.h"

@implementation LPCViewController

- (instancetype)initWithParameterObj:(id)object
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _transferParameter = object;
    }
    return self;
}

- (instancetype)initWithParameterDic:(NSDictionary *)dic
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _dicParameter = dic;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"deallocClass : %@",[self class]);
}

//- (void)viewDidLayoutSubviews
//{
//    // 检查子视图是否有ambiguous layout
//    for (UIView *subview in self.view.subviews) {
//        if ([subview hasAmbiguousLayout]) {
//            NSLog(@"AMBIGUOUS: %@", subview);
//        }
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configNotificationCenter];
    [self configData];
    //    [self configSystemAdaptation];
    [self configUI];
    [self configRequest];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateData];
    [self updateUI];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

//去通知中心注册
- (void)configNotificationCenter{}
//初始化数据
- (void)configData{}
////系统适配
//- (void)configSystemAdaptation
//{
//    if (@available(iOS 11.0, *)) {
//
//    }else {
//        self.automaticallyAdjustsScrollViewInsets =NO;
//    }
//}
//初始化UI
- (void)configUI {}
//初始化请求
- (void)configRequest {}
//刷新
- (void)refreshDataWithDic:(NSDictionary *)dic {}
//更新数据
- (void)updateData {}
//更新UI
- (void)updateUI {}


#pragma mark - (基础)Action
- (void)actionBack
{
    //方式一
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    /*
     //方式二
     if (self.navigationController.topViewController == self) {
     [self.navigationController popViewControllerAnimated:YES];
     } else {
     [self dismissViewControllerAnimated:YES completion:nil];
     }
     */
}

@end
