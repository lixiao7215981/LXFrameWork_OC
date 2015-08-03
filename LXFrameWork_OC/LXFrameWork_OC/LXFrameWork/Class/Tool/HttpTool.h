//
//  HttpTool.h
//  LiXiao
//
//  Created by 李晓 on 15/7/2.
//  Copyright (c) 2015年 BookStore. All rights reserved.
//

#import <AFNetworking.h>

typedef enum {
    JSONResponseSerializer,
    XMLParserResponseSerializer,
    HTTPResponseSerializer
} serializer;

@interface HttpTool : NSObject

/**
 *  利用 AFNetWorking 发送GET请求
 *
 */
+ (void) HttpToolGetWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;

/**
 *  利用 AFNetWorking 发送GET请求,设置返回值类型
 *
 */
+ (void) HttpToolGetWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Serializer:(serializer) serializer Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;

/**
 *  利用 AFNetWorking 发送PUT请求
 *
 */
+ (void) HttpToolPutWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;

/**
 *  利用 AFNetWorking 发送PUT请求,设置返回值类型
 *
 */
+ (void) HttpToolPutWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Serializer:(serializer) serializer Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;

/**
 *  利用 AFNetWorking 发送Delete请求
 *
 */
+ (void) HttpToolDeleteWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;

/**
 *  利用 AFNetWorking 发送Delete请求,设置返回值类型
 *
 */
+ (void) HttpToolDeleteWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Serializer:(serializer) serializer Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;


/**
 *  利用 AFNetWorking 发送POST请求
 *
 */
+ (void) HttpToolPostWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;

/**
 *  利用 AFNetWorking 发送POST请求，可以上传数据
 *
 */
+ (void) HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Data:(NSData *) data Name:(NSString *)name FileName:(NSString *) fileName MainType:(NSString *)mainType  Success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *  利用 AFNetWorking 发送POST请求,设置返回值类型
 *
 */
+ (void) HttpToolPostWithUrl:(NSString *) url paramesers:(NSDictionary *) parameser Serializer:(serializer) serializer Success:(void(^)(id json)) success failure:(void (^)(NSError *error)) failure;

@end
