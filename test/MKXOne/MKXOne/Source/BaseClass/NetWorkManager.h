//
//  NetWorkManager.h
//  MKXOne
//
//  Created by mike on 16/5/5.
//  Copyright © 2016年 mike. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^Succeed) (NSURLSessionTask *task, NSDictionary *dict);
typedef void (^Fail) (NSURLSessionTask *task, NSError *error);



// 网络监控类
@interface NetWorkManager : NSObject
+ (instancetype) shareNetWorkManeger;

- (void) postWithString: (NSString *)string ofAttribute: (NSDictionary *)attribute inSucceed: (Succeed)succeed orFail: (Fail)fail;
- (void) getWithString: (NSString *)string ofAttribute: (NSDictionary *)attribute inSucceed: (Succeed)succeed orFail: (Fail)fail;


@end
