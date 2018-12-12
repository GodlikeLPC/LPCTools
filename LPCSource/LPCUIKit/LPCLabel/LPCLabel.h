//
//  LPCLabel.h
//  LPCTool
//
//  Created by 李沛池 on 2018/11/29.
//

#import <UIKit/UIKit.h>

@interface LPCLabel : UILabel

/**
 文字内边距
 */
@property (assign, nonatomic) UIEdgeInsets textInsets;

/**
 *  设置行间距
 *
 *  @param lineSpacing 行间距
 *  @param string      文本
 */
- (void)setAttributedTextWithLineSpacing:(CGFloat)lineSpacing withString:(NSString *)string;

@end
