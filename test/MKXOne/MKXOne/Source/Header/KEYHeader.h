//
//  KEYHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里是三方key的声明/宏定义.

#ifndef Project_KEYHeader_h
#define Project_KEYHeader_h

#ifdef DEBUG
//  输出
#define XJLog(format, ...) NSLog(format, ## __VA_ARGS__)

#else

#define XJLog(format, ...)

#endif

//  weak宏
#define WeakObj(object) __weak typeof(object) object##Weak = object;

//  屏幕宽度高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//  字号宏
#define tabBarFont [UIFont systemFontOfSize:17]



#endif
