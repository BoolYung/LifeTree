//
//  AFAppClient.h
//  单耳兔
//
//  Created by yang on 16/6/1.
//  Copyright © 2016年 珠海单耳兔电子商务有限公司. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppClient : AFHTTPSessionManager
//+ (instancetype)sharedClient;
+ (NSURLSessionDataTask *)PostAPIWithparameters:(id)parameters
                   globalTimelinePostsWithBlock:(void (^)(id jsonData, NSError *error))block;

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
  globalTimelinePostsWithBlock:(void (^)(id jsonData, NSError *error))block;

@end
