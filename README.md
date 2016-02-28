# JMRoundedCorner

[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/raozhizhen/JMRoundedCorner/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/JMRoundedCorner.svg?style=flat)](http://cocoapods.org/?q=JMRoundedCorner)&nbsp;
[![SUPPORT](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
[![BLOG](https://img.shields.io/badge/blog-raozhizhen.com-orange.svg?style=flat)](http://raozhizhen.com)&nbsp;

当我们需要给一个View设置圆角的时候，一般会这样写
	
	 _label.layer.cornerRadius = 10;
  	 _label.layer.masksToBounds = YES;
  	 
cornerRadius和maskToBounds独立作用的时候都不会有太大的性能问题，但是当他俩结合在一起，就触发了屏幕外渲染，下图中黄色的部分就是离屏渲染的地方。

![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2582.PNG?raw=true)

####离屏渲染是什么？

简单来说，就是本该由GPU干的活，交给CPU干了。又因为，CPU不太擅长干GPU的活，所以往往会拖慢UI层的FPS。
我们需要尽量避免这种情况。

####使用JMRoundedCorner来绘制圆角


	platform :ios, '7.0'
	
	pod 'JMRoundedCorner', '~> 1.0.0'
	
	#import "UIView+RoundedCorner.h"

	
	
#####给view设置一个圆角边框

	- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

#####给view设置一个圆角背景颜色

	- (void)setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)color;

#####给view设置一个圆角背景图

	- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image;

#####给view设置一个contentMode模式的圆角背景图

	- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode;

#####设置所有属性配置出一个圆角背景图
	- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)color backgroundImage:(UIImage *)backgroundImage ContentMode:(UIViewContentMode)contentMode;


#####代码示例

    _label = [[UILabel alloc] initWithFrame:CGRectMake(70 + viewWidth, 7, viewWidth, 40)];
    _label.text = @"这是一个lable";
    [_label setCornerRadius:10 withBorderColor:[UIColor redColor] borderWidth:0.5];
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];

这样，绘制出了圆角，也可以避免在大量cell离屏渲染的时候拖慢FPS，(支持Autolayout布局)
![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2580.PNG?raw=true)


将Demo下下来，试试使用JMRoundedCorner带来的顺滑提升。

#####0.0.4版本支持通过JMRadius设置4个角为不同的弧度，例如：

	- (void)setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;


![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2592.PNG?raw=true)
####联系我

- QQ:337519524
- 邮箱：raozhizhen@gmail.com

####感谢

- [reviewcode.cn](http://www.reviewcode.cn/article.html?reviewId=7)

####更新日志

- 2016/2/28  1.0.0版本 ：发布正式版本

- 2016/2/26  0.0.4版本 ：去掉了size参数及支持JMRadius设置4个角为不同的弧度

- 2016/2/25  0.0.3版本 ：去掉了UIImageView这个中间控件

- 2016/2/24  0.0.2版本 ：支持设置背景图片的绘制模式（cotentmode）

- 2016/2/23  0.0.1版本 ：绘制一个圆角image
