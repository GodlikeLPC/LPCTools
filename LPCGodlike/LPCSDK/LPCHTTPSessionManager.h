//
//  LPCHTTPSessionManager.h
//  LPCTools
//
//  Created by 李沛池 on 2017/8/6.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "LPCMBProgressHUD.h"

@interface LPCHTTPSessionManager : AFHTTPSessionManager


- (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

+ (void)getDataFromParametersAndHideHUD:(NSDictionary *)parameters
                              urlSuffix:(NSString *)urlSuffix
                                success:(void (^)(id))success
                                failure:(void (^)(id))failure
                                    hud:(LPCMBProgressHUD *)hud;

+ (void)aliyunDataWithPath:(NSString *)path
                    querys:(NSDictionary *)querys
                   success:(void (^)(NSDictionary *json))success
                   failure:(void (^)(NSError *error))failure;
@end
