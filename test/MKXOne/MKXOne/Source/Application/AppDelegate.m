//
//  AppDelegate.m
//  项目作业01_1
//
//  Created by mike on 15/12/22.
//  Copyright © 2015年 mike. All rights reserved.
//

#import "AppDelegate.h"



@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    //  初始化 window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RootTabbarController *rootTab = [[RootTabbarController alloc] init];
    MyViewController *one = [MyViewController new];
    
    BokeTableViewController *boke = [BokeTableViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:boke];
    rootTab.viewControllers = @[one, nav];
    
    self.window.rootViewController = rootTab;
    [self.window makeKeyAndVisible];
    
    
    
    // 添加网络监控
    NetWorkManager *manager = [NetWorkManager shareNetWorkManeger];
    
//    NSString *str = @"https://www.quanziben.com/service/AppLogin/login";
//    NSDictionary *dict = @{
//                           @"phone": @"15600615234",
//                           @"password": @"xujia108"
//                           };
//    
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [manager postWithString:str ofAttribute:dict inSucceed:^(NSURLSessionTask *task, NSDictionary *dicto) {
//            NSLog(@"+++++%lld", task.countOfBytesExpectedToReceive);
//            NSLog(@"+++++%lld", task.countOfBytesExpectedToSend);
//            NSLog(@"+++++%lld", task.countOfBytesReceived);
//            NSLog(@"+++++%lld", task.countOfBytesSent);
//
//            NSLog(@"------%@", dicto);
//        } orFail:^(NSURLSessionTask *task, NSError *error) {
//            NSLog(@"%@", error);
//        }];
//
//    });
    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
