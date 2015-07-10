//
//  HttpTool.m
//  LiXiao
//
//  Created by 李晓 on 15/7/2.
//  Copyright (c) 2015年 BookStore. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool

+(void)HttpToolGetWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Data:(NSData *)data Name:(NSString *)name FineName:(NSString *)fileName MainType:(NSString *)mainType Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameser constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:mainType];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)HttpToolGetWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    
    manager.responseSerializer = ser;
    [manager GET:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    manager.responseSerializer = ser;
    [manager POST:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
