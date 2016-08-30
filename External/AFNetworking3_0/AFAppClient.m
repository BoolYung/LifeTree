//
//  AFAppClient.m
//  单耳兔
//
//  Created by yang on 16/6/1.
//  Copyright © 2016年 珠海单耳兔电子商务有限公司. All rights reserved.
//

#import "AFAppClient.h"

@implementation AFAppClient
//+ (instancetype)sharedClient {
//    static AFAppClient *_sharedClient = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedClient = [[AFAppClient alloc] initWithBaseURL:[NSURL URLWithString:APIURL]];
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    });
//    
//    return _sharedClient;
//}

+ (NSURLSessionDataTask *)PostAPIWithparameters:(id)parameters
                   globalTimelinePostsWithBlock:(void (^)(id jsonData, NSError *error))block {
    
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setSecurityPolicy:securityPolicy];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager POST:APIURL parameters:parameters progress:nil success:^(NSURLSessionDataTask *__unused task,id JSON) {
        if (block) {
            block(JSON,nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task,NSError *error){
        if (block) {
            block([NSArray array],error);
        }
    }];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
  globalTimelinePostsWithBlock:(void (^)(id jsonData, NSError *error))block {
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setSecurityPolicy:securityPolicy];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *__unused task,id JSON) {
        if (block) {
            block(JSON,nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task,NSError *error){
        if (block) {
            block([NSArray array],error);
        }
    }];
}
@end
