//
//  UITableViewCell+XJCategory.m
//  MKXOne
//
//  Created by mike on 16/5/26.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "UITableViewCell+XJCategory.h"

@implementation UITableViewCell (XJCategory)

-(void)addSubviews:(NSArray<UIView *> *)subViews {
    for (UIView *view in subViews) {
        [self.contentView addSubview:view];
    }
}

@end
