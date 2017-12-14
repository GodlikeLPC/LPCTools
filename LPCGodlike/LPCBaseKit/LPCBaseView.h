//
//  LPCBaseView.h
//  LPCTools
//
//  Created by 李沛池 on 2017/12/14.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCView.h"
#import "LPCDefine.h"

@protocol ActionInViewDelegate <NSObject>

/**
 * 第一个参数 sender 用来区分子view中多个点击事件；
 * 第二个参数 view 用来区分点击的view
 * 第三个参数 obj 有时候需要将数据传给控制器，方便做一些处理；
 */
- (void)viewActionWithSender:(id)sender withView:(UIView *)view withObject:(id)obj;

@end

typedef void (^LPCBaseViewBlock)(id);

@interface LPCBaseView : LPCView


@property (nonatomic, strong) NSString *viewTag; //标签(用来区分特殊的View)

@property (nonatomic, assign) id obj; //传递的对象

@property (nonatomic, copy) LPCBaseViewBlock bvBlock;

@property (nonatomic, assign) id <ActionInViewDelegate> delegate;  //代理属性

- (void)initData;
- (void)initUI;

- (void)updateData:(id)item;

//寻找view所属的viewController
- (UIViewController*)viewController;


@end
