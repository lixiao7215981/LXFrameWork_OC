//
//  HttpTool.m
//  LiXiao
//
//  Created by 李晓 on 15/7/2.
//  Copyright (c) 2015年 BookStore. All rights reserved.
//

#import "HttpTool.h"
#import "HttpToolLogModel.h"
#import "NSDate+Extension.h"
#import "NSString+Extension.h"
#import "NSObject+JSONCategories.h"

@implementation HttpTool

//+ (void) requestSuccessUrl:(NSString *) url WithRequestData:(NSDictionary *)requestData AndresponseData:(id)responseObject
//{
//    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//    HttpToolLogModel *httplog = [[HttpToolLogModel alloc] init];
//    httplog.request_time = [[NSDate new]FormatterYMDHMS];
//    httplog.request_dict  = requestData;
//    httplog.request_URL = url;
//    httplog.isSuccess = YES;
//    httplog.result_dict = responseDict;
//    [HttpToolLogModel addHttpToolLog:httplog];
//}
//
//+ (void) requestFailureUrl:(NSString *) url WithRequestData:(NSDictionary *)requestData AndresponseData:(NSError *)failure
//{
//    HttpToolLogModel *httplog = [[HttpToolLogModel alloc] init];
//    httplog.request_time = [[NSDate new]FormatterYMDHMS];
//    httplog.request_dict = requestData;
//    httplog.request_URL = url;
//    httplog.isSuccess = NO;
//    httplog.result_dict = failure.userInfo;
//    [HttpToolLogModel addHttpToolLog:httplog];
//}

+(void)HttpToolGetWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
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
    manager.requestSerializer.timeoutInterval = 30;
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

+ (void)HttpToolPostWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Data:(NSData *)data Name:(NSString *)name FileName:(NSString *)fileName MainType:(NSString *)mainType Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
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
    manager.requestSerializer.timeoutInterval = 30;
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
    manager.requestSerializer.timeoutInterval = 30;
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

+ (void)HttpToolPutWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    [manager PUT:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}

+(void)HttpToolPutWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    manager.responseSerializer = ser;
    [manager PUT:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)HttpToolDeleteWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    [manager DELETE:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}

+ (void)HttpToolDeleteWithUrl:(NSString *)url paramesers:(NSDictionary *)parameser Serializer:(serializer)serializer Success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    AFHTTPResponseSerializer *ser = [AFHTTPResponseSerializer serializer];
    if (serializer == JSONResponseSerializer) {
        ser = [AFJSONResponseSerializer serializer];
    }else if (serializer == XMLParserResponseSerializer){
        ser = [AFXMLParserResponseSerializer serializer];
    }
    manager.responseSerializer = ser;
    [manager DELETE:url parameters:parameser success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}

@end
