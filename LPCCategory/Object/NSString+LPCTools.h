//
//  NSString+LPCTools.h
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIFont.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LPCTools)

/**
 字符串去空格
 */
- (NSString *)stringDeleteSpace;

/**
 返回文字宽度(大于或者等于指定表达式的最小整数)
 */
- (CGFloat)getWidthWithFont:(UIFont *)font;

/**
 默认返回32位小写md5
 */
- (NSString *)md5EncodeString;

/**
 32位 大写
 */
- (NSString *)MD5ForUpper32Bate;

/**
 32位 小写
 */
- (NSString *)MD5ForLower32Bate;

/**
 16位 大写
 */
- (NSString *)MD5ForUpper16Bate;

/**
 16位 小写
 */
- (NSString *)MD5ForLower16Bate;

@end

NS_ASSUME_NONNULL_END
