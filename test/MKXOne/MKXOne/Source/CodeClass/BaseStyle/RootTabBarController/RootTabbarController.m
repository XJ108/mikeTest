//
//  RootViewController.m
//  MKXOne
//
//  Created by mike on 16/5/10.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "RootTabbarController.h"

@interface RootTabbarController ()

@end

@implementation RootTabbarController

+ (void)initialize
{
    // 初始化字号和颜色
    NSMutableDictionary *normalDict = [NSMutableDictionary dictionary];
    normalDict[NSFontAttributeName] = tabBarFont;
    normalDict[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    NSMutableDictionary *selecteddict = [NSMutableDictionary dictionary];
    selecteddict[NSFontAttributeName] = tabBarFont;
    selecteddict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:normalDict forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selecteddict forState:UIControlStateSelected];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    [super setViewControllers:viewControllers];
    for (UIViewController *controller in viewControllers) {
        controller.tabBarItem.title = @"测试";
    }
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
