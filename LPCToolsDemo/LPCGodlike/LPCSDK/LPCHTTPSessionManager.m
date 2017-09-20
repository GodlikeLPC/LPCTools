//
//  LPCHTTPSessionManager.m
//  EverydayNews
//
//  Created by 李沛池 on 2017/8/6.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCHTTPSessionManager.h"
#import "LPCTools.h"

//#define URLSTRING @"https://123.206.254.155"
#define URLSTRING @"http://123.206.215.23:8082"
//#define URLSTRING @"https://123.206.215.23"

@interface LPCHTTPSessionManager ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionAF;

@end

@implementation LPCHTTPSessionManager

- (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *bodyParameters = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)parameters];
//    [bodyParameters setObject:@"ios" forKey:@"os"];
    
    NSLog(@"requestData(神) = \n%@%@\n",URLString,[LPCTools strRequestWithDictionary:bodyParameters]);
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:bodyParameters options:0 error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:bodyParameters error:nil];
    
    req.timeoutInterval = 13.0f;
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if (success) {
                success(responseObject);
            }
        } else {
            if (failure) {
                failure(error);
            }
            NSLog(@"Error: %@, %@, %@", error, response, responseObject);
        }
    }] resume];
}

+ (void)aliyunDataWithPath:(NSString *)path
                    querys:(NSDictionary *)querys
                   success:(void (^)(NSDictionary *json))success
                   failure:(void (^)(NSError *error))failure
{
    NSString *appcode = APPCODE_aliyun;
    NSString *host = @"https://ali-stock.showapi.com";
//    NSString *path = @"/stocklist";
    NSString *method = @"GET";
//    NSString *querys = @"?market=sh&page=1";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",host,path,[LPCTools strRequestWithDictionary:querys]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:1 timeoutInterval:13.0f];
    request.HTTPMethod = method;
    [request addValue:[NSString stringWithFormat:@"APPCODE %@",appcode] forHTTPHeaderField:@"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSLog(@"requestData() = \n%@\n",request.URL);
    
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       if (!error) {
                                                           if (success) {
                                                               NSDictionary* json = [NSJSONSerialization JSONObjectWithData:body options:kNilOptions error:&error];
                                                               success(json);
                                                           }
                                                       } else {
                                                           if (failure) {
                                                               failure(error);
                                                           }
                                                       }
                                                   }];
    
    [task resume];
}

+ (void)getDataFromParametersAndHideHUD:(NSDictionary *)parameters
                              urlSuffix:(NSString *)urlSuffix
                                success:(void (^)(id))success
                                failure:(void (^)(id))failure
                                    hud:(LPCMBProgressHUD *)hud
{
    LPCHTTPSessionManager *manager = [[LPCHTTPSessionManager alloc] init];
    NSString *url = [NSString stringWithFormat:@"%@/%@",URLSTRING,urlSuffix];
    [manager POST:url parameters:parameters success:^(id responseObject) {
        [hud hide];
        NSDictionary *dicResult = responseObject;
        if (success) {
            success(dicResult);
        }else {
            [LPCMBProgressHUD showErrorWithText:@"网络连接错误"];
        }
    } failure:^(NSError *error) {
        [hud hide];
        [LPCMBProgressHUD showErrorWithText:@"网络连接错误"];
        if (failure) {
            failure(error);
        }
    }];
}

@end
