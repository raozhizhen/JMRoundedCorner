//
//  ViewController3.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/3/12.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "ViewController3.h"
#import "UIView+RoundedCorner.h"
#import "UIControl+YYAdd.h"

@implementation ViewController3 {
    UIImageView *_imageView;
    UISlider *_slider0;
    UISlider *_slider1;
    UISlider *_slider2;
    UISlider *_slider3;
    UISlider *_slider4;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试用页面";
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
    [_imageView jm_setJMRadius:JMRadiusMake(20, 20, 20, 20) withBorderColor:[UIColor redColor] borderWidth:10 backgroundColor:[UIColor blueColor] backgroundImage:[UIImage imageNamed:@"avatar.jpg"] contentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:_imageView];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 400, 300, 200)];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.image = [UIImage imageNamed:@"avatar.jpg"];
//    imageView.layer.borderWidth = 10;
//    imageView.layer.borderColor = [UIColor redColor].CGColor;
//    imageView.layer.cornerRadius = 20;
//    imageView.layer.masksToBounds = YES;
//    imageView.contentMode = contentMode;
//    [self.view addSubview:imageView];
    
    _slider0 = [[UISlider alloc] initWithFrame:CGRectMake(20, 400, 300, 20)];
    _slider0.minimumValue = 0;
    _slider0.maximumValue = 300;
    _slider0.value = 20;
    [self.view addSubview:_slider0];

    _slider1 = [[UISlider alloc] initWithFrame:CGRectMake(20, 440, 300, 20)];
    _slider1.minimumValue = 0;
    _slider1.maximumValue = 300;
    _slider1.value = 20;
    [self.view addSubview:_slider1];
    
    _slider2 = [[UISlider alloc] initWithFrame:CGRectMake(20, 480, 300, 20)];
    _slider2.minimumValue = 0;
    _slider2.maximumValue = 300;
    _slider2.value = 20;
    [self.view addSubview:_slider2];
    
    _slider3 = [[UISlider alloc] initWithFrame:CGRectMake(20, 520, 300, 20)];
    _slider3.minimumValue = 0;
    _slider3.maximumValue = 300;
    _slider3.value = 20;
    [self.view addSubview:_slider3];
    
    _slider4 = [[UISlider alloc] initWithFrame:CGRectMake(20, 560, 300, 20)];
    _slider4.minimumValue = 0;
    _slider4.maximumValue = 30;
    _slider4.value = 10;
    [self.view addSubview:_slider4];
    
    __weak typeof(self) _self = self;
    [_slider0 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [_self changed];
    }];
    [_slider1 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [_self changed];
    }];
    [_slider2 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [_self changed];
    }];
    [_slider3 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [_self changed];
    }];
    [_slider4 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [_self changed];
    }];
}

- (void)changed {
    [_imageView jm_setJMRadius:JMRadiusMake(_slider0.value, _slider1.value, _slider2.value, _slider3.value) withBorderColor:[UIColor redColor] borderWidth:_slider4.value backgroundColor:[UIColor blueColor] backgroundImage:[UIImage imageNamed:@"avatar.jpg"] contentMode:UIViewContentModeScaleAspectFill];
}


@end
