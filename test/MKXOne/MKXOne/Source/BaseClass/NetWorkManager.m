//
//  NetWorkManager.m
//  MKXOne
//
//  Created by mike on 16/5/5.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "NetWorkManager.h"
@interface NetWorkManager ()

@property (nonatomic, strong) AFNetworkReachabilityManager *manager;
@property (nonatomic, strong)AFHTTPSessionManager *sessionManager;

@end

@implementation NetWorkManager
//  服务器地址字符串
static const NSString  * const urlString = @"";

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpManager];
    }
    return self;
}

- (void)setUpManager {
    
    self.sessionManager = [AFHTTPSessionManager manager];
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    __weak typeof(self) weakSelf = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"XXXX" message:@"KKKKK" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOpen = [UIAlertAction actionWithTitle:@"open" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //  alertcontroller 直接调用打开系统设置方法会有 bug, 所以用延迟一点执行
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf openSystemSetupController];
        });
    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:actionOpen];
    [alert addAction:actionCancel];
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    // 设置网络监控
     self.manager = [AFNetworkReachabilityManager sharedManager];
    [self.manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                //                AFNetworkReachabilityStatusUnknown          = -1,
                //                AFNetworkReachabilityStatusNotReachable     = 0,
                //                AFNetworkReachabilityStatusReachableViaWWAN = 1,
                //                AFNetworkReachabilityStatusReachableViaWiFi
            case AFNetworkReachabilityStatusUnknown:
                [controller presentViewController:alert animated:YES completion:nil];
                XJLog(@"unknown");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [controller presentViewController:alert animated:YES completion:nil];
                XJLog(@"notreachable");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                XJLog(@"3g");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                XJLog(@"wifi");
                break;
                
            default:
                break;
        }
    }];
    [self.manager startMonitoring];
}

+(instancetype)shareNetWorkManeger{
    
    static NetWorkManager *manager = nil;
    if (manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[NetWorkManager alloc] init];
        });
    }
    return manager;
}


- (void)openSystemSetupController {
    
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];[[UIApplication sharedApplication] openURL:url];
    }
}

// 网络状态判断是否可用
- ( BOOL) networkStatusJudge {
    if (self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusUnknown || self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        XJLog(@"无网");
        return NO;
    }
    return YES;
}


// post 请求
- (void)postWithString:(NSString *)string ofAttribute:(NSDictionary *)attribute inSucceed:(Succeed)succeed orFail:(Fail)fail {
    if (![self networkStatusJudge]) {
        return;
    }
    
    string = [NSString stringWithFormat:@"%@%@", urlString, string];
    [self.sessionManager POST:string parameters:attribute progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        succeed(task, dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task, error);
    }];
    
}

// get 请求
- (void)getWithString:(NSString *)string ofAttribute:(NSDictionary *)attribute inSucceed:(Succeed)succeed orFail:(Fail)fail {
    if (![self networkStatusJudge]) {
        return;
    }
    
    string = [NSString stringWithFormat:@"%@%@", urlString, string];
    [self.sessionManager GET:string parameters:attribute progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        succeed(task, dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task, error);
    }];
}

@end
