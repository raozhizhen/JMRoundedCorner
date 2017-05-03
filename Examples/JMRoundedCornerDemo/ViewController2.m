//
//  ViewController2.m
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/7.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import "ViewController2.h"
#import "JMRoundedCorner.h"
#import "UIControl+YYAdd.h"

@implementation ViewController2 {
    UIImageView *_imageView;
    UISlider *_slider0;
    UISlider *_slider1;
    UISlider *_slider2;
    UISlider *_slider3;
    UISlider *_slider4;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试用页面";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat viewWidth = self.view.frame.size.width - 40;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, viewWidth, 200)];
    [_imageView jm_setImageWithJMRadius: JMRadiusMake(20, 20, 20, 20) image:[UIImage imageNamed:@"avatar"] borderColor:[UIColor redColor] borderWidth:10 backgroundColor:[UIColor blueColor] contentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:_imageView];
    
    _slider0 = [[UISlider alloc] initWithFrame:CGRectMake(20, 340, viewWidth, 20)];
    _slider0.minimumValue = 0;
    _slider0.maximumValue = 300;
    _slider0.value = 20;
    [self.view addSubview:_slider0];
    
    _slider1 = [[UISlider alloc] initWithFrame:CGRectMake(20, 380, viewWidth, 20)];
    _slider1.minimumValue = 0;
    _slider1.maximumValue = 300;
    _slider1.value = 20;
    [self.view addSubview:_slider1];
    
    _slider2 = [[UISlider alloc] initWithFrame:CGRectMake(20, 420, viewWidth, 20)];
    _slider2.minimumValue = 0;
    _slider2.maximumValue = 300;
    _slider2.value = 20;
    [self.view addSubview:_slider2];
    
    _slider3 = [[UISlider alloc] initWithFrame:CGRectMake(20, 460, viewWidth, 20)];
    _slider3.minimumValue = 0;
    _slider3.maximumValue = 300;
    _slider3.value = 20;
    [self.view addSubview:_slider3];
    
    _slider4 = [[UISlider alloc] initWithFrame:CGRectMake(20, 520, viewWidth, 20)];
    _slider4.minimumValue = 0;
    _slider4.maximumValue = 30;
    _slider4.value = 10;
    [self.view addSubview:_slider4];
    
    __weak typeof(self) weakSelf = self;
    [_slider0 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [weakSelf sliderChanged];
    }];
    [_slider1 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [weakSelf sliderChanged];
    }];
    [_slider2 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [weakSelf sliderChanged];
    }];
    [_slider3 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [weakSelf sliderChanged];
    }];
    [_slider4 addBlockForControlEvents:UIControlEventValueChanged block:^(id sender) {
        [weakSelf sliderChanged];
    }];
}

- (void)sliderChanged {
    [_imageView jm_setImageWithJMRadius:JMRadiusMake(_slider0.value, _slider1.value, _slider2.value, _slider3.value) imageURL:[NSURL URLWithString:@"https://oepjvpu5g.qnssl.com/avatar12.jpg"] placeholder:[UIImage imageNamed:@"avatar"] borderColor:[UIColor redColor] borderWidth:_slider4.value backgroundColor:[UIColor whiteColor] contentMode:UIViewContentModeScaleAspectFill size:CGSizeMake(self.view.frame.size.width - 40, 200)];
    
//    [_imageView jm_setImageWithJMRadius:JMRadiusMake(_slider0.value, _slider1.value, _slider2.value, _slider3.value) image:[UIImage imageNamed:@"avatar.jpg"] borderColor:[UIColor redColor] borderWidth:_slider4.value backgroundColor:[UIColor blueColor] contentMode:UIViewContentModeScaleAspectFill];
}

@end
