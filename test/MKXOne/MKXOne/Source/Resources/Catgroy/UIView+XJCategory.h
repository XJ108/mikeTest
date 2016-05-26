//
//  UIView+XJCategory.h
//  MKXOne
//
//  Created by mike on 16/5/23.
//  Copyright © 2016年 mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XJCategory)

//  快速设置frame 单一元素值
- (void) setX: (CGFloat)x;
- (void) setY: (CGFloat)y;
- (void) setWidth: (CGFloat)width;
- (void) setHeight: (CGFloat)height;

//  获取 frame 中单一元素值
- (CGFloat) getX;
- (CGFloat) getY;
- (CGFloat) getWidth;
- (CGFloat) getHeight;

//  获取 view 最大的 X 和 Y
- (CGFloat) getMaxX;
- (CGFloat) getMaxY;

/**
 *  添加多个子视图
 *
 *  @param subViews 子视图数组 按数组顺序添加
 */
- (void) addSubviews:(NSArray <UIView *>*)subViews;


@end
