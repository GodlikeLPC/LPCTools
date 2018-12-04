//
//  LPCCollectionViewCell.h
//  LPCTools
//
//  Created by 李沛池 on 2018/12/4.
//

#import <UIKit/UIKit.h>

@interface LPCCollectionViewCell : UICollectionViewCell

/**
 基于数据更新页面
 */
- (void)updateData:(id)model;

- (void)updateDataWithIndex:(NSInteger)index obj:(id)object;

@end
