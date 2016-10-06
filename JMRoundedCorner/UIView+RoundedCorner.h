//
//  UIView+RoundedCorner.h
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/25.
//  Copyright © 2016年 Jim. All rights reserved.
//
//使用这个类就可以了

#import <UIKit/UIKit.h>
#import "UIImage+RoundedCorner.h"

@interface UIView (RoundedCorner)

/**配置所有属性设置圆角背景图*/
- (void)jm_setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode size:(CGSize)size;

/**设置圆角背景图*/
- (void)jm_setCornerRadius:(CGFloat)radius withImage:(UIImage *)image;

/**设置四个圆角弧度不同的圆角背景图*/
- (void)jm_setJMRadius:(JMRadius)radius withImage:(UIImage *)image;


/**设置 contentMode 模式的圆角背景图*/
- (void)jm_setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode;

/**设置四个圆角弧度不同的 contentMode 模式的圆角背景图*/
- (void)jm_setJMRadius:(JMRadius)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode;

/**设置圆角边框*/
- (void)jm_setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

/**设置四个圆角弧度不同的圆角边框*/
- (void)jm_setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;


/**设置圆角背景颜色*/
- (void)jm_setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)backgroundColor;

/**设置四个圆角弧度不同的圆角背景颜色*/
- (void)jm_setJMRadius:(JMRadius)radius withBackgroundColor:(UIColor *)backgroundColor;


/**设置所有属性配置圆角背景图*/
- (void)jm_setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode;

/**设置所有属性配置四个圆角弧度不同的圆角背景图*/
- (void)jm_setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode;

@end
