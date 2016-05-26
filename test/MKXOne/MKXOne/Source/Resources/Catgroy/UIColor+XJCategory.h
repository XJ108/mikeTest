//
//  UIColor+XJCategory.h
//  MKXOne
//
//  Created by mike on 16/5/23.
//  Copyright © 2016年 mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XJCategory)

/**
 *   自动将int转换为 0~1 值
 *
 *  @param intRed   int
 *  @param intGreen int
 *  @param intBlue  int
 *  @param alpha CGFloat
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithIntRed: (int)intRed intGreen: (int)intGreen intBlue: (int)intBlue alpha: (CGFloat)alpha;
@end
