//
//  LPCViewController.h
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import <UIKit/UIKit.h>

@interface LPCViewController : UIViewController

@property (nonatomic, strong) id transferParameter; //VC间传参
@property (nonatomic, strong) NSDictionary *dicParameter; //VC间传参
@property (nonatomic, copy) void (^blockParameter)(id obj); //回调

- (instancetype)initWithParameterObj:(id)object;

- (instancetype)initWithParameterDic:(NSDictionary *)dic;

/**
 去通知中心注册
 */
- (void)configNotificationCenter;

/**
 初始化数据
 */
- (void)configData;

/**
 初始化UI
 */
- (void)configUI;

/**
 默认请求
 */
- (void)configRequest;

/**
 刷新
 */
- (void)refreshDataWithDic:(NSDictionary *)dic;

/**
 更新数据
 */
- (void)updateData;

/**
 更新UI
 */
- (void)updateUI;


#pragma mark - (基础)Action
/**
 通用ViewController的返回方法
 */
- (void)actionBack;

@end
