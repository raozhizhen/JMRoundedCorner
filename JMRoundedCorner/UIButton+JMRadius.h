//
//  UIButton+JMRadius.h
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/9.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+JMRadius.h"

@interface UIButton (JMRadius)

/**设置圆角背景图，默认 UIViewContentModeScaleAspectFill 模式*/
- (void)jm_setImageWithCornerRadius:(CGFloat)radius
                           imageURL:(NSURL *)imageURL
                        placeholder:(NSString *)placeholder
                               size:(CGSize)size
                           forState:(UIControlState)state;

/**设置圆角背景图，默认 UIViewContentModeScaleAspectFill 模式*/
- (void)jm_setImageWithJMRadius:(JMRadius)radius
                       imageURL:(NSURL *)imageURL
                    placeholder:(NSString *)placeholder
                           size:(CGSize)size
                       forState:(UIControlState)state;

/**设置 contentMode 模式的圆角背景图*/
- (void)jm_setImageWithCornerRadius:(CGFloat)radius
                           imageURL:(NSURL *)imageURL
                        placeholder:(NSString *)placeholder
                        contentMode:(UIViewContentMode)contentMode
                               size:(CGSize)size
                           forState:(UIControlState)state;

/**设置 contentMode 模式的圆角背景图*/
- (void)jm_setImageWithJMRadius:(JMRadius)radius
                       imageURL:(NSURL *)imageURL
                    placeholder:(NSString *)placeholder
                    contentMode:(UIViewContentMode)contentMode
                           size:(CGSize)size
                       forState:(UIControlState)state;

/**配置所有属性配置圆角背景图*/
- (void)jm_setImageWithJMRadius:(JMRadius)radius
                       imageURL:(NSURL *)imageURL
                    placeholder:(NSString *)placeholder
                    borderColor:(UIColor *)borderColor
                    borderWidth:(CGFloat)borderWidth
                backgroundColor:(UIColor *)backgroundColor
                    contentMode:(UIViewContentMode)contentMode
                           size:(CGSize)size
                       forState:(UIControlState)state;

@end
