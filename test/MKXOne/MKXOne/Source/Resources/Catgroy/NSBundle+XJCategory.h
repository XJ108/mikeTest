//
//  NSBundle+XJCategory.h
//  MKXOne
//
//  Created by mike on 16/5/23.
//  Copyright © 2016年 mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (XJCategory)

/**
 *  根据文件名获取文件路径
 *
 *  @param fileName  fileName
 *
 *  @return filePathString
 */
+ (NSString *) getFilePathInBundleWithFileName: (NSString *)fileName;

/**
 *  Document路径
 *
 *  @return  NSString
 */
+ (NSString *) getDocumentPath;

/**
 *  获取系统信息字典
 *
 *  @return  NSDictionary
 */
+ (NSDictionary *) getInfoDictionary;

@end
