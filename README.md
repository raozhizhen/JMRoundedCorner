# JMRoundedCorner
给UIView设置圆角

当我们需要给一个View设置圆角的时候，一般会这样写
	
	 _label.layer.cornerRadius = 10;
  	 _label.layer.masksToBounds = YES;
  	 
cornerRadius和maskToBounds独立作用的时候都不会有太大的性能问题，但是当他俩结合在一起，就触发了屏幕外渲染，下图中黄色的部分就是离屏渲染的地方。

![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2582.PNG?raw=true)

####离屏渲染是什么？

简单来说，就是本该由GPU干的活，交给CPU干了。又因为，CPU不太擅长干GPU的活，所以往往会拖慢UI层的FPS。
我们需要尽量避免这种情况。

	_label.layer.shouldRasterize = YES;  
	_label.layer.rasterizationScale = [UIScreen mainScreen].scale;
	
	
shouldRasterize = YES会使视图渲染内容被缓存起来，下次绘制的时候可以直接显示缓存，但如下图，依旧有离屏渲染，导致tableView滑动起来依旧很卡

![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2580.PNG?raw=true)

所以这个方法并不怎么靠谱

####使用JMRoundedCorner来绘制圆角


	platform :ios, '7.0'
	
	pod 'JMRoundedCorner', '~> 0.0.3'
	
	#import "UIView+RoundedCorner.h"

	
	
#####给view设置一个圆角边框

	- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth size:(CGSize)size;

#####给view设置一个圆角背景颜色

	- (void)setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)color size:(CGSize)size;

#####给view设置一个圆角背景图

	- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image size:(CGSize)size;

#####给view设置一个contentMode模式的圆角背景图

	- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode size:(CGSize)size;

#####设置所有属性配置出一个圆角背景图
	- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)color backgroundImage:(UIImage *)backgroundImage ContentMode:(UIViewContentMode)contentMode size:(CGSize)size;


#####代码示例

    _label = [[UILabel alloc] initWithFrame:CGRectMake(70 + viewWidth, 7, viewWidth, 40)];
    _label.text = @"这是一个lable";
    [_label setCornerRadius:10 withBorderColor:[UIColor redColor] borderWidth:1 size:CGSizeMake(viewWidth, 40)];
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];

这样，绘制出了圆角，也可以避免在大量cell离屏渲染的时候拖慢FPS

![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2581.PNG?raw=true)


将Demo下下来，试试使用JMRoundedCorner带来的顺滑提升。

####联系我

- QQ:337519524
- 邮箱：raozhizhen@gmail.com

####感谢

- [reviewcode.cn](http://www.reviewcode.cn/article.html?reviewId=7)

