//
//  LPCTableViewCell.h
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN const CGFloat LPCTableViewCell_BtnTag_Basic;

@protocol LPCTableViewCellDelegate <NSObject>

@optional
/**
 点击cell上的按钮回调代理方法
 
 @param btnIndex 按钮次序
 @param indexPath cell的位置
 */
-(void)actionCellClickWithBtnIndex:(NSUInteger)btnIndex cellIndexPath:(NSIndexPath *)indexPath object:(id)object;

@end

@interface LPCTableViewCell : UITableViewCell

@property (nonatomic,assign) id<LPCTableViewCellDelegate> delegate;

@property (nonatomic,copy) void (^actionBlock)(id obj);

@property (nonatomic, strong) NSIndexPath *cellIndexPath; //cell的位置

- (void)configUI;

/**
 基于数据更新页面
 */
- (void)updateData:(id)model;

- (void)updateDataWithIndex:(NSInteger)index obj:(id)object;

@end
