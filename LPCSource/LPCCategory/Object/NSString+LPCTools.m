//
//  NSString+LPCTools.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "NSString+LPCTools.h"
#import<CommonCrypto/CommonDigest.h>

@implementation NSString (LPCTools)

//字符串去空格
- (NSString *)stringDeleteSpace
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

//返回文字宽度
- (CGFloat)getWidthWithFont:(UIFont *)font
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return ceil(rect.size.width); //返回大于或者等于指定表达式的最小整数
}

//默认返回32位小写md5
- (NSString *)md5EncodeString
{
    return [self MD5ForLower32Bate];
}


#pragma mark - 32位 小写
- (NSString *)MD5ForLower32Bate
{
    //要进行UTF8的转码
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

#pragma mark - 32位 大写
- (NSString *)MD5ForUpper32Bate
{
    //要进行UTF8的转码
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}

#pragma mark - 16位 大写
- (NSString *)MD5ForUpper16Bate
{
    NSString *md5Str = [self MD5ForUpper32Bate];
    
    NSString  *string;
    for (int i = 0; i < 24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}


#pragma mark - 16位 小写
- (NSString *)MD5ForLower16Bate
{
    NSString *md5Str = [self MD5ForLower32Bate];
    
    NSString  *string;
    for (int i = 0; i < 24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

@end
