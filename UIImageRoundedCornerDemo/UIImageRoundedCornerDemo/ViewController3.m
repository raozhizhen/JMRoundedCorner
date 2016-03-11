//
//  ViewController3.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/3/12.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "ViewController3.h"
#import "UIView+RoundedCorner.h"

@implementation ViewController3


- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat radius = 150;
    CGFloat width = 20;
    UIViewContentMode contentMode = UIViewContentModeScaleAspectFill;
    self.title = @"测试用页面";
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
    [imageView jm_setJMRadius:JMRadiusMake(arc4random_uniform((u_int32_t)radius), arc4random_uniform((u_int32_t)radius), arc4random_uniform((u_int32_t)radius), arc4random_uniform((u_int32_t)radius)) withBorderColor:[UIColor redColor] borderWidth:width backgroundColor:[UIColor blueColor] backgroundImage:[UIImage imageNamed:@"avatar.jpg"] contentMode:contentMode];
    [self.view addSubview:imageView];
    
    UIImageView *_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 320, 300, 200)];
    [_imageView jm_setJMRadius:JMRadiusMake(arc4random_uniform((u_int32_t)radius), arc4random_uniform((u_int32_t)radius), arc4random_uniform((u_int32_t)radius), arc4random_uniform((u_int32_t)radius)) withBorderColor:[UIColor redColor] borderWidth:width backgroundColor:[UIColor blueColor] backgroundImage:[UIImage imageNamed:@"avatar.jpg"] contentMode:contentMode];
    [self.view addSubview:_imageView];
}

@end
