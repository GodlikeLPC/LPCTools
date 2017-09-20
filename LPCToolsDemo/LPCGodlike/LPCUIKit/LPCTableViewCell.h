//
//  LPCTableViewCell.h
//  EverydayNews
//
//  Created by 李沛池 on 2017/8/6.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCUIKit.h"

@protocol ActionInCellDelegate <NSObject>

/**
 * 第一个参数 sender 用来区分子cell中多个点击事件；
 * 第二个参数 cell 用来区分点击的cell
 * 第三个参数 indexPath 用来区分点击的cell在TableView中的位置
 * 第四个参数 obj 有时候需要将数据传给控制器，方便做一些处理；
 */
- (void)cellActionWithSender:(id)sender withCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath withObject:(id)obj;

@end

@interface LPCTableViewCell : UITableViewCell

@property (nonatomic, assign) id <ActionInCellDelegate> delegate;  //代理属性

@property (nonatomic, copy)   void(^baseCellBlock)(void);          //block

@property (nonatomic, assign) id obj;                              //传递的对象

@property (nonatomic, strong) NSIndexPath *indexPath;              //tableView的indexPath

- (void)initUI;

- (void)updateData:(id)model;

- (void)updateData:(id)model withDic:(id)dic;

- (void)updateData:(id)model withObject:(id)object;

//寻找cell所属的viewController
- (UIViewController*)viewController;

@end
