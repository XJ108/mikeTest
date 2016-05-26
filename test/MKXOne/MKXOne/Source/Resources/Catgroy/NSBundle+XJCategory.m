//
//  NSBundle+XJCategory.m
//  MKXOne
//
//  Created by mike on 16/5/23.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "NSBundle+XJCategory.h"

@implementation NSBundle (XJCategory)

/**
 *  根据文件名获取文件路径
 *
 *  @param fileName  fileName
 *
 *  @return filePathString
 */
+ (NSString *) getFilePathInBundleWithFileName: (NSString *)fileName{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
}

/**
 *  Document路径
 *
 *  @return  NSString
 */
+ (NSString *) getDocumentPath{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] ;
}

/**
 *  获取系统信息字典
 *
 *  @return  NSDictionary
 */
+ (NSDictionary *) getInfoDictionary {
    return [[NSBundle mainBundle] infoDictionary];
}
@end
