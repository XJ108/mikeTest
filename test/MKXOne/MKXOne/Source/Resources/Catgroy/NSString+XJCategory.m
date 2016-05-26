//
//  NSString+XJCategory.m
//  MKXOne
//
//  Created by mike on 16/5/23.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "NSString+XJCategory.h"

#define Regular_ExpressionOfEMail @"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"
#define Regular_ExpressionOfTelephoneNumber @"^(([+])\\d{1,4})*(\\d{3,4})*\\d{7,8}(\\d{1,4})*$"
#define Regular_ExpressionOfMobileTelephoneNumber @"^(([+])\\d{1,4})*1[3|4|5|8][0-9]\\d{8}$"

@implementation NSString (XJCategory)

/**
 *  是否为空
 *
 *  @return  Bool
 */
- (BOOL) isNil {
    if ([self isEqualToString:@""] || [self isEqual:nil])
        return YES;
    return NO;
}

/**
 *  是否包含字符串
 *
 *  @param string  string
 *
 *  @return Bool
 */
- (BOOL) isIncludeString: (NSString *)string {
    if ([self isNil])
        return NO;
    NSRange range = [self rangeOfString:string];
    if (range.location == NSNotFound)
        return NO;
    return YES;
}

/**
 *  去除字符串中的空格
 *
 *  @param sting  NSString
 *
 *  @return NSString
 */
- (NSString *) removeSpaceInString{
    if ([self isNil]) {
        return nil;
    }
    @autoreleasepool {
        NSArray *array = [self componentsSeparatedByString:@" "];
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:array];
        NSMutableArray *indexarry = [NSMutableArray array];
        for (int i = 0; i < array.count; i++) {
            if ([array[i] isNil]) {
                [indexarry addObject:[NSNumber numberWithInt:i]];
            }
        }
        if (indexarry.count != 0) {
            for (int i = (int)indexarry.count; i > 0; i--) {
                [tempArray removeObjectAtIndex:[indexarry[i - 1] intValue]] ;
            }
        }
        NSString *str = @"";
        for (NSString *arryStr in tempArray) {
            str = [NSString stringWithFormat:@"%@%@", str, arryStr];
        }
        return str;
    }
}


/**
 *  是否符合正则表达式要求
 *
 *  @param regular_expression 正则表达式
 *
 *  @return  BOOL
 */
- (BOOL) isAccordOfRegular_Expression: (NSString *)regular_expression {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular_expression];
    return [predicate evaluateWithObject:self];
}

/**
 *  是否为电话号码
 *
 *  @return  Bool
 */
- (BOOL) isTelephoneNumberString {
    return [self isAccordOfRegular_Expression:Regular_ExpressionOfEMail];
}

/**
 *  是否为油箱地址
 *
 *  @return  BOOl
 */
- (BOOL) isEMailString{
    return [self isAccordOfRegular_Expression:Regular_ExpressionOfTelephoneNumber];
}

/**
 *  是否为移动电话号码
 *
 *  @return  Bool
 */
- (BOOL) isMobileTelephoneNumberString{
    return [self isAccordOfRegular_Expression:Regular_ExpressionOfMobileTelephoneNumber];
}

/**
 *  获取项目名称
 *
 *  @return  NSString
 */
+ (NSString *) getExecutableKey {
    return [[NSBundle getInfoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
}

/**
 *  获取项目版本号
 *
 *  @return NSString
 */
+ (NSString *) getVersionKey {
    return [[NSBundle getInfoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

/**
 *  获取app 版本号
 *
 *  @return  NSString
 */
+ (NSString *) getShortVersionKey {
    return [[NSBundle getInfoDictionary] objectForKey: @"CFBundleShortVersionString"];
}


@end
