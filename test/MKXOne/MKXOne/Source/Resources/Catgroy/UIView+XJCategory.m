//
//  UIView+XJCategory.m
//  MKXOne
//
//  Created by mike on 16/5/23.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "UIView+XJCategory.h"

@implementation UIView (XJCategory)

//  快速设置frame 单一元素值
- (void) setX: (CGFloat)x {
    self.frame = CGRectMake(x, [self getY], [self getWidth], [self getHeight]);
}
- (void) setY: (CGFloat)y {
    self.frame = CGRectMake([self getX], y, [self getWidth], [self getHeight]);
}
- (void) setWidth: (CGFloat)width {
    self.frame = CGRectMake([self getX], [self getY], width, [self getHeight]);
}
- (void) setHeight: (CGFloat)height {
    self.frame = CGRectMake([self getX], [self getY], [self getWidth], height);
}

//  获取 frame 中单一元素值
- (CGFloat) getX {
    return self.frame.origin.x;
}
- (CGFloat) getY {
    return self.frame.origin.y;
}
- (CGFloat) getWidth {
    return self.frame.size.width;
}
- (CGFloat) getHeight {
    return self.frame.size.height;
}

//  获取 view 最大的 X 和 Y
- (CGFloat) getMaxX {
    return [self getX] + [self getWidth];
}
- (CGFloat) getMaxY {
    return [self getY] + [self getHeight];
}


/**
 *  添加多个子视图
 *
 *  @param subViews 子视图数组 按数组顺序添加
 */
-(void)addSubviews:(NSArray <UIView *>*)subViews {
    for (UIView *view in subViews) {
        [self addSubview:view];
    }
}

@end
