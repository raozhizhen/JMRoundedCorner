//
//  UIImageView+JMRadius.m
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/9.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import "UIImageView+JMRadius.h"
#import <UIImageView+YYWebImage.h>

@implementation UIImageView (JMRadius)

- (void)jm_setImageWithCornerRadius:(CGFloat)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder size:(CGSize)size {
    [self jm_setImageWithJMRadius:JMRadiusMake(radius, radius, radius, radius) imageURL:imageURL placeholder:placeholder borderColor:nil borderWidth:0 backgroundColor:nil contentMode:UIViewContentModeScaleAspectFill size:size];
}

- (void)jm_setImageWithJMRadius:(JMRadius)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder size:(CGSize)size {
    [self jm_setImageWithJMRadius:radius imageURL:imageURL placeholder:placeholder borderColor:nil borderWidth:0 backgroundColor:nil contentMode:UIViewContentModeScaleAspectFill size:size];
}

- (void)jm_setImageWithCornerRadius:(CGFloat)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    [self jm_setImageWithJMRadius:JMRadiusMake(radius, radius, radius, radius) imageURL:imageURL placeholder:placeholder borderColor:nil borderWidth:0 backgroundColor:nil contentMode:contentMode size:size];
}

- (void)jm_setImageWithJMRadius:(JMRadius)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    [self jm_setImageWithJMRadius:radius imageURL:imageURL placeholder:placeholder borderColor:nil borderWidth:0 backgroundColor:nil contentMode:contentMode size:size];
}

- (void)jm_setImageWithJMRadius:(JMRadius)radius imageURL:(NSURL *)imageURL placeholder:(NSString *)placeholder borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor contentMode:(UIViewContentMode)contentMode size:(CGSize)size {
    
    NSString *transformKey =  [NSString stringWithFormat:@"-%.1f-%.1f-%.1f-%.1f-%@-%.1f-%@-%li-%.1f-%.1f", radius.topLeftRadius, radius.topRightRadius, radius.bottomLeftRadius, radius.bottomRightRadius, borderColor.description, borderWidth, backgroundColor.description, contentMode, size.width, size.height];
    NSString *imageKey = [NSString stringWithFormat:@"%@-%@", transformKey, imageURL];

    UIImage *cacheImage = [[YYWebImageManager sharedManager].cache getImageForKey:imageKey];
    UIImage *placeholderImage;
    if (cacheImage) {
        self.image = cacheImage;
    } else {
        if (placeholder || borderWidth > 0 || backgroundColor) {
            NSString *placeholderKey = [NSString stringWithFormat:@"%@-%@", transformKey, placeholder];
            placeholderImage = [[YYWebImageManager sharedManager].cache getImageForKey:placeholderKey];
            if (!placeholderImage) {
                placeholderImage = [UIImage jm_setJMRadius:radius image:[UIImage imageNamed:placeholder] size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
                [[YYWebImageManager sharedManager].cache setImage:placeholderImage forKey:placeholderKey];
            }
        }
        [self yy_setImageWithURL:imageURL placeholder:placeholderImage options:kNilOptions progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
            UIImage *currentImage = [UIImage jm_setJMRadius:radius image:image size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
            [[YYWebImageManager sharedManager].cache setImage:currentImage forKey:imageKey];
            return currentImage;
        } completion:nil];
    }
}

@end
