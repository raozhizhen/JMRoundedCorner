//
//  UIImageView+JMRadius.m
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/9.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import "UIImageView+JMRadius.h"
#import <YYWebImage/UIImageView+YYWebImage.h>

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
    
    NSString *transformKey =  [NSString stringWithFormat:@"%@%@%.1f%@%li%@", NSStringFromJMRadius(radius), borderColor.description, borderWidth, backgroundColor.description, (long)contentMode,NSStringFromCGSize(size)];
    NSString *transformImageKey = [[YYWebImageManager sharedManager] cacheKeyForURL:imageURL transformKey:transformKey];
    UIImage *cacheImage = [[YYWebImageManager sharedManager].cache getImageForKey:transformImageKey];
    
    if (cacheImage) {
        self.image = cacheImage;
        return;
    }
    
    NSString *imageKey = [[YYWebImageManager sharedManager] cacheKeyForURL:imageURL transformKey:nil];
    cacheImage = [[YYWebImageManager sharedManager].cache getImageForKey:imageKey];
    
    if (cacheImage) {
        self.image = [UIImage jm_setJMRadius:radius image:cacheImage size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
        return;
    }
    
    UIImage *placeholderImage;
    if (placeholder || borderWidth > 0 || backgroundColor) {
        NSString *placeholderKey = [NSString stringWithFormat:@"%@-%@", transformKey, placeholder];
        placeholderImage = [[YYWebImageManager sharedManager].cache getImageForKey:placeholderKey];
        if (!placeholderImage) {
            placeholderImage = [UIImage jm_setJMRadius:radius image:[UIImage imageNamed:placeholder] size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
            [[YYWebImageManager sharedManager].cache setImage:placeholderImage forKey:placeholderKey];
        }
    }
    
    [self yy_setImageWithURL:imageURL placeholder:placeholderImage options:kNilOptions progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        [[YYWebImageManager sharedManager].cache setImage:image forKey:imageKey];
        UIImage *currentImage = [UIImage jm_setJMRadius:radius image:image size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor withContentMode:contentMode];
        return currentImage;
    } transformKey:transformKey completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
    }];
}

@end
