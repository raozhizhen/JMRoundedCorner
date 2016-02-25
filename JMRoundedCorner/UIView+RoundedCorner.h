//
//  UIView+RoundedCorner.h
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/25.
//  Copyright © 2016年 Jim. All rights reserved.
//
//使用这个类就可以了

#import <UIKit/UIKit.h>

@interface UIView (RoundedCorner)

@property (nonatomic, strong) UIImageView *roundedCornerView;

/**给view设置一个圆角边框*/
- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth size:(CGSize)size;

/**给view设置一个圆角背景颜色*/
- (void)setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)color size:(CGSize)size;

/**给view设置一个圆角背景图*/
- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image size:(CGSize)size;

/**给view设置一个contentMode模式的圆角背景图*/
- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode size:(CGSize)size;

/**设置所有属性配置出一个圆角背景图*/
- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)color backgroundImage:(UIImage *)backgroundImage ContentMode:(UIViewContentMode)contentMode size:(CGSize)size;

@end
