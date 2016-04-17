//
//  UIView+RoundedCorner.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/25.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "UIView+RoundedCorner.h"
#import <objc/runtime.h>

@implementation UIView (RoundedCorner)

- (void)jm_setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    [self jm_setCornerRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)jm_setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    [self jm_setJMRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)jm_setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)backgroundColor {
    [self jm_setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:backgroundColor backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)jm_setJMRadius:(JMRadius)radius withBackgroundColor:(UIColor *)backgroundColor {
    [self jm_setJMRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:backgroundColor backgroundImage:nil contentMode:UIViewContentModeScaleAspectFill];
}

- (void)jm_setCornerRadius:(CGFloat)radius withImage:(UIImage *)image {
    [self jm_setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:UIViewContentModeScaleAspectFill];
}

- (void)jm_setJMRadius:(JMRadius)radius withImage:(UIImage *)image {
    [self jm_setJMRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:UIViewContentModeScaleAspectFill];
}

- (void)jm_setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode {
    [self jm_setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:contentMode];
}

- (void)jm_setJMRadius:(JMRadius)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode {
    [self jm_setJMRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:contentMode];
}

- (void)jm_setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode {
    [self jm_setJMRadius:JMRadiusMake(radius, radius, radius, radius) withBorderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor backgroundImage:backgroundImage contentMode:contentMode];
}

- (void)jm_setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode {
    NSValue *radiusValue = [NSValue valueWithBytes:&radius objCType:@encode(JMRadius)];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    dic[@"radius"] = radiusValue;
    
    if (borderColor)
        dic[@"borderColor"] = borderColor;
    else
        dic[@"borderColor"] = NSNull.null;
    
    dic[@"borderWidth"] = [NSNumber numberWithFloat:borderWidth];
    
    if (backgroundColor)
        dic[@"backgroundColor"] = backgroundColor;
    else
        dic[@"backgroundColor"] = NSNull.null;
    
    if (backgroundImage)
        dic[@"backgroundImage"] = backgroundImage;
    else
        dic[@"backgroundImage"] = NSNull.null;
    
    dic[@"contentMode"] = [NSNumber numberWithFloat:contentMode];
    
    [self setNeedsLayout];
    [self performSelector:@selector(setRadius:) withObject:dic afterDelay:0 inModes:@[NSRunLoopCommonModes]];
}

- (void)setRadius:(NSMutableDictionary *)dic {
    if (self.bounds.size.width == 0 || self.bounds.size.height == 0) {
        NSLog(@"JMRoundedCorner 可能受到某些邪恶力量的影响，没有在布局之后拿到 view 的 size （也可能这个 View 的 size 就是这个样子 -。-！），可以调用方法，- jm_setJMRadius: withBorderColor: borderWidth: backgroundColor: backgroundImage: contentMode: size: 方法给 JMRoundedCorner 提供 size");
        return;
    }
    JMRadius radius;
    [dic[@"radius"] getValue:&radius];
    UIColor *borderColor;
    UIColor *backgroundColor;
    UIImage *backgroundImage;
    
    if (dic[@"borderColor"] == NSNull.null)
        borderColor = nil;
    else
        borderColor = dic[@"borderColor"];
    
    if (dic[@"backgroundColor"] == NSNull.null)
        backgroundColor = nil;
    else
        backgroundColor = dic[@"backgroundColor"];
    
    if (dic[@"backgroundImage"] == NSNull.null)
        backgroundImage = nil;
    else
        backgroundImage = dic[@"backgroundImage"];
    
    [self jm_setJMRadius:radius withBorderColor:borderColor borderWidth:[dic[@"borderWidth"] floatValue] backgroundColor:backgroundColor backgroundImage:backgroundImage contentMode:[dic[@"contentMode"] integerValue] size:self.bounds.size];
}

- (void)jm_setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGSize size2 = CGSizeMake(pixel(size.width), pixel(size.height));
        UIImage *image = [UIImage jm_imageWithRoundedCornersAndSize:size2 JMRadius:radius borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor backgroundImage:backgroundImage withContentMode:contentMode];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.frame = CGRectMake(pixel(self.frame.origin.x), pixel(self.frame.origin.y), size.width, size.height);
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = image;
            } else if ([self isKindOfClass:[UIButton class]] && backgroundImage) {
                [((UIButton *)self) setBackgroundImage:image forState:UIControlStateNormal];
            } else if ([self isKindOfClass:[UILabel class]]) {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            } else {
                self.layer.contents = (__bridge id _Nullable)(image.CGImage);
            }
        });
    });
}

static inline float pixel(float num) {
    float unit = 1.0 / [UIScreen mainScreen].scale;
    double remain = fmod(num, unit);
    return num - remain + (remain >= unit / 2.0? unit: 0);
}

@end
