//
//  UIView+RoundedCorner.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/25.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "UIView+RoundedCorner.h"
#import "UIImage+RoundedCorner.h"
#import <objc/runtime.h>

@implementation UIView (RoundedCorner)

static const NSString *MyRoundedCornerViewKey = @"MyRoundedCornerViewKey";

- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth size:(CGSize)size {
    [self setCornerRadius:radius withBorderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil ContentMode:UIViewContentModeScaleToFill size:size];
}

- (void)setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)color size:(CGSize)size {
    [self setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:color backgroundImage:nil ContentMode:UIViewContentModeScaleToFill size:size];
}

- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image size:(CGSize)size {
    [self setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image ContentMode:UIViewContentModeScaleAspectFill size:size];
}

- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    [self setCornerRadius:radius withBorderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:image ContentMode:contentMode size:size];
}

- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)color backgroundImage:(UIImage *)backgroundImage ContentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    UIImage *image = [UIImage jm_imageWithRoundedCornersAndSize:size CornerRadius:radius borderColor:borderColor borderWidth:borderWidth backgroundColor:color backgroundImage:backgroundImage withContentMode:contentMode];
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

- (void)setRoundedCornerView:(id)roundedCornerView {
    objc_setAssociatedObject(self, &MyRoundedCornerViewKey, roundedCornerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
