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

static const NSString *MyRoundedCornerViewKey = @"MyRoundedCornerViewKey";

- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    
    [self setCornerRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil contentMode:UIViewContentModeScaleToFill];
}

- (void)setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    
    [self setJMRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil contentMode:UIViewContentModeScaleToFill];
}

- (void)setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)backgroundColor {
    
    [self setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:backgroundColor backgroundImage:nil contentMode:UIViewContentModeScaleToFill];
}

- (void)setJMRadius:(JMRadius)radius withBackgroundColor:(UIColor *)backgroundColor {
    
    [self setJMRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:backgroundColor backgroundImage:nil contentMode:UIViewContentModeScaleToFill];
}

- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image {
    
    [self setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:UIViewContentModeScaleAspectFill];
}

- (void)setJMRadius:(JMRadius)radius withImage:(UIImage *)image {
    
    [self setJMRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:UIViewContentModeScaleAspectFill];
}

- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode {
    
    [self setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:contentMode];
}

- (void)setJMRadius:(JMRadius)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode {
    
    [self setJMRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image contentMode:contentMode];
}

- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode {
    
    [self setJMRadius:JMRadiusMake(radius, radius, radius, radius) withBorderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor backgroundImage:backgroundImage contentMode:contentMode];
}

- (void)setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode {
    
    [self setNeedsLayout];
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
    
    [self performSelector:@selector(setRadius:) withObject:dic afterDelay:0 inModes:@[NSRunLoopCommonModes]];
}

- (void)setRadius:(NSMutableDictionary *)dic {
    
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
    
    [self setJMRadius:radius withBorderColor:borderColor borderWidth:[dic[@"borderWidth"] floatValue] backgroundColor:backgroundColor backgroundImage:backgroundImage contentMode:[dic[@"contentMode"] integerValue] size:self.bounds.size];
}

- (void)setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    
    UIImage *image = [UIImage jm_imageWithRoundedCornersAndSize:size JMRadius:radius borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor backgroundImage:backgroundImage withContentMode:contentMode];
    if ([self isKindOfClass:[UIImageView class]]) {
        ((UIImageView *)self).image = image;
    } else if ([self isKindOfClass:[UIButton class]] && backgroundImage) {
        [((UIButton *)self) setBackgroundImage:image forState:UIControlStateNormal];
    } else {
        self.roundedCornerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        self.roundedCornerView.image = image;
        [self addSubview:self.roundedCornerView];
        [self sendSubviewToBack:self.roundedCornerView];
    }
}

- (UIImageView *)roundedCornerView {
    return objc_getAssociatedObject(self, &MyRoundedCornerViewKey);
}

- (void)setRoundedCornerView:(UIImageView *)roundedCornerView {
    objc_setAssociatedObject(self, &MyRoundedCornerViewKey, roundedCornerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
