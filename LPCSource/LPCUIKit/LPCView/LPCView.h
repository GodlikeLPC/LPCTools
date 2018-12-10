//
//  LPCView.h
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN const CGFloat LPCView_BtnTag_Basic; //默认tag值

typedef void (^ActionBlock)(id obj);
typedef void (^ActionBlockForIndex)(NSUInteger index);

@interface LPCView : UIView

//属性使用`IBInspectable`可在xib的右侧的属性(Attributes inspector)标签栏中看到
//@property (nonatomic, assign) IBInspectable BOOL godlike;

@property (nonatomic,copy) ActionBlock         actionBlock;
@property (nonatomic,copy) ActionBlockForIndex actionBlockForIndex;

- (void)configUI;

- (void)updateData:(id)object;

- (void)updateDataWithIndex:(NSInteger)index;

@end
