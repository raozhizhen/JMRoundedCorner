//
//  UIImage+RoundedCorner.m
//  SelectTags
//
//  Created by jm on 16/2/22.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "UIImage+RoundedCorner.h"
#import "LPMath.h"

@implementation UIImage (RoundedCorner)
- (UIImage *)jm_imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius {
    return [UIImage jm_imageWithRoundedCornersAndSize:sizeToFit CornerRadius:radius borderColor:nil borderWidth:0 backgroundColor:nil backgroundImage:self];
}

+ (UIImage *)jm_imageWithRoundedCornersAndSize:(CGSize)sizeToFit CornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [UIImage jm_imageWithRoundedCornersAndSize:sizeToFit CornerRadius:radius borderColor:borderColor borderWidth:borderWidth backgroundColor:nil backgroundImage:nil];
}

+ (UIImage *)jm_imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius andColor:(UIColor *)color {
    return [UIImage jm_imageWithRoundedCornersAndSize:sizeToFit CornerRadius:radius borderColor:nil borderWidth:0 backgroundColor:color backgroundImage:nil];
}

+ (UIImage *)jm_imageWithRoundedCornersAndSize:(CGSize)sizeToFit CornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage {
    sizeToFit = CGSizeMake(pixel(sizeToFit.width), sizeToFit.height);
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    if ((borderWidth != 0 && borderColor) || backgroundColor) {
        //设置上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        //边框大小
        CGContextSetLineWidth(context, borderWidth);
        //边框颜色
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        //矩形填充颜色
        if (!backgroundColor) {
            backgroundColor = [UIColor whiteColor];
        }
        CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
        CGFloat height = sizeToFit.height;
        CGFloat width = sizeToFit.width;
        CGFloat boardWidth = borderWidth / 2;
        CGFloat drawRadius = radius - boardWidth;
        
        CGContextMoveToPoint(context, width - boardWidth, drawRadius + boardWidth);  // 开始坐标右边开始
        CGContextAddArcToPoint(context, width - boardWidth, height - boardWidth, width - drawRadius - boardWidth, height - boardWidth, drawRadius);  // 右下角角度
        CGContextAddArcToPoint(context, boardWidth, height - boardWidth, boardWidth, height - drawRadius - boardWidth, drawRadius); // 左下角角度
        CGContextAddArcToPoint(context, boardWidth, boardWidth, width - boardWidth, boardWidth, drawRadius); // 左上角
        CGContextAddArcToPoint(context, width - boardWidth, boardWidth, width - boardWidth, drawRadius + boardWidth, drawRadius); // 右上角
        CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    }
    if (backgroundImage) {
        backgroundImage = [backgroundImage scaleToSize:sizeToFit];
        CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
        CGContextAddPath(UIGraphicsGetCurrentContext(),
                         [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
        CGContextClip(UIGraphicsGetCurrentContext());
        [backgroundImage drawInRect:rect];
    }
    
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outImage;
}

- (UIImage*)scaleToSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = size.height * 1.0 / height;
    float horizontalRadio = size.width * 1.0 / width;
    float radio = 1;
    if (verticalRadio > 1 && horizontalRadio > 1) {
        radio = verticalRadio < horizontalRadio ? horizontalRadio : verticalRadio;
    } else {
        radio = verticalRadio > horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width * radio;
    height = height * radio;
    
    int xPos = (size.width - width) / 2;
    int yPos = (size.height - height) / 2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
