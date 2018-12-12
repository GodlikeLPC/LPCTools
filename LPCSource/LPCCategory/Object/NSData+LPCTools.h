//
//  NSData+LPCTools.h
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (LPCTools)

/**
 AES加密
 */
- (NSData *)AES256EncryptWithKey:(NSString *)key;

/**
 AES解密
 */
- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
