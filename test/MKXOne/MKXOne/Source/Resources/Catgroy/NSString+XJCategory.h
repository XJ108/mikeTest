//
//  NSString+XJCategory.h
//  MKXOne
//
//  Created by mike on 16/5/23.
//  Copyright © 2016年 mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XJCategory)

/**
 *  是否为空
 *
 *  @return  Bool
 */
- (BOOL) isNil;

/**
 *  是否包含字符串
 *
 *  @param string  string
 *
 *  @return Bool
 */
- (BOOL) isIncludeString: (NSString *)string;

/**
 *  去除字符串中的空格
 *
 *  @param sting  NSString
 *
 *  @return NSString
 */
- (NSString *) removeSpaceInString;

/**
 *  是否为电话号码
 *
 *  @return  Bool
 */
- (BOOL) isTelephoneNumberString;

/**
 *  是否为油箱地址
 *
 *  @return  BOOl
 */
- (BOOL) isEMailString;

/**
 *  是否为移动电话号码
 *
 *  @return  Bool
 */
- (BOOL) isMobileTelephoneNumberString;


/**
 *  是否符合正则表达式要求
 *
 *  @param regular_expression 正则表达式
 *
 *  @return  BOOL
 */
- (BOOL) isAccordOfRegular_Expression: (NSString *)regular_expression;

/**
 *  获取项目名称
 *
 *  @return  NSString
 */
+ (NSString *) getExecutableKey;

/**
 *  获取项目版本号
 *
 *  @return NSString
 */
+ (NSString *) getVersionKey;

/**
 *  获取app 版本号
 *
 *  @return  NSString
 */
+ (NSString *) getShortVersionKey;

/**
 *  获取手机序列号
 *
 *  @return  NSString
 */
+ (NSString *) getUniqueIdentifier;

@end
