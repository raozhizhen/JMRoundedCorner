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

static inline NSString * NSStringFromJMRadius(JMRadius radius) {
    return [NSString stringWithFormat:@"{%.2f, %.2f, %.2f, %.2f}", radius.topLeftRadius, radius.topRightRadius, radius.bottomLeftRadius, radius.bottomRightRadius];
}

@interface UIImage (RoundedCorner)

- (UIImage *)jm_setRadius:(CGFloat)radius
                     size:(CGSize)size;

- (UIImage *)jm_setRadius:(CGFloat)radius
                     size:(CGSize)size
              contentMode:(UIViewContentMode)contentMode;

+ (UIImage *)jm_setRadius:(CGFloat)radius
                     size:(CGSize)size
              borderColor:(UIColor *)borderColor
              borderWidth:(CGFloat)borderWidth
          backgroundColor:(UIColor *)backgroundColor;

+ (UIImage *)jm_setJMRadius:(JMRadius)radius
                      image:(UIImage *)image
                       size:(CGSize)size
                borderColor:(UIColor *)borderColor
                borderWidth:(CGFloat)borderWidth
            backgroundColor:(UIColor *)backgroundColor
            withContentMode:(UIViewContentMode)contentMode;

@end
