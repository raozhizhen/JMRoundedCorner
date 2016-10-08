//
//  UIImage+RoundedCorner.h
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/22.
//  Copyright © 2016年 Jim. All rights reserved.
//
//生成带圆角的图片

#import <UIKit/UIKit.h>

struct JMRadius {
    CGFloat topLeftRadius;
    CGFloat topRightRadius;
    CGFloat bottomLeftRadius;
    CGFloat bottomRightRadius;
};
typedef struct JMRadius JMRadius;

static inline JMRadius JMRadiusMake(CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomLeftRadius, CGFloat bottomRightRadius) {
    JMRadius radius;
    radius.topLeftRadius = topLeftRadius;
    radius.topRightRadius = topRightRadius;
    radius.bottomLeftRadius = bottomLeftRadius;
    radius.bottomRightRadius = bottomRightRadius;
    return radius;
}

@interface UIImage (RoundedCorner)

+ (UIImage *)jm_setJMRadius:(JMRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage withContentMode:(UIViewContentMode)contentMode;

- (UIImage *)jm_setRadiu:(CGFloat)radiu size:(CGSize)size;

- (UIImage *)jm_setRadiu:(CGFloat)radiu size:(CGSize)size contentMode:(UIViewContentMode)contentMode;

+ (UIImage *)jm_setRadiu:(CGFloat)radiu size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor;

@end
