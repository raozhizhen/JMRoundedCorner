# JMRoundedCorner

[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/raozhizhen/JMRoundedCorner/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/JMRoundedCorner.svg?style=flat)](http://cocoapods.org/?q=JMRoundedCorner)&nbsp;
[![SUPPORT](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
[![BLOG](https://img.shields.io/badge/blog-raozhizhen.com-orange.svg?style=flat)](http://raozhizhen.com)&nbsp;

当我们需要给一个View设置圆角的时候，一般会这样写

```objc	
_label.layer.cornerRadius = 10;
_label.layer.masksToBounds = YES;
```  	 
  	 
cornerRadius和maskToBounds独立作用的时候都不会有太大的性能问题，但是当他俩结合在一起，就触发了离屏渲染，
Instrument的Core Animation 有一个叫做Color Offscreen-Rendered Yellow的选项。它会将已经被渲染到屏幕外缓冲区的区域标注为黄色，下图中黄色的部分就是离屏渲染的地方。

![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2582.PNG?raw=true)

####离屏渲染是什么？

离屏渲染绘制layer tree中的一部分到一个新的缓存里面（这个缓存不是屏幕，是另一个地方），然后再把这个缓存渲染到屏幕上面。一般来说，你需要避免离屏渲染。因为这个开销很大。在屏幕上面直接合成层要比先创建一个离屏缓存然后在缓存上面绘制，最后再绘制缓存到屏幕上面快很多。这里面有2个上下文环境的切换（切换到屏幕外缓存环境，和屏幕环境）。

####解决方案

用GraphicsContext生成一张带圆角的图,设置view.layer.contents为这张图片。

####使用JMRoundedCorner来绘制圆角


	platform :ios, '7.0'
	
	pod 'JMRoundedCorner', '~> 1.0.2'
	
	#import "UIView+RoundedCorner.h"

	
	
#####给view设置一个圆角边框

```objc	
- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
```

#####给view设置一个圆角背景颜色

```objc
- (void)setCornerRadius:(CGFloat)radius withBackgroundColor:(UIColor *)backgroundColor;
```

#####给view设置一个圆角背景图

```objc
- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image;
```

#####给view设置一个contentMode模式的圆角背景图

```objc
- (void)setCornerRadius:(CGFloat)radius withImage:(UIImage *)image contentMode:(UIViewContentMode)contentMode;
```

#####设置所有属性配置出一个圆角背景图

```objc
- (void)setCornerRadius:(CGFloat)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage ContentMode:(UIViewContentMode)contentMode;
```

#####代码示例

```objc
_label = [[UILabel alloc] initWithFrame:CGRectMake(70 + viewWidth, 7, viewWidth, 40)];
_label.text = @"这是一个label";
[_label setCornerRadius:10 withBorderColor:[UIColor redColor] borderWidth:0.5];
_label.font = [UIFont systemFontOfSize:12];
_label.textAlignment = NSTextAlignmentCenter;
[self.contentView addSubview:_label];
```

```objc
[[SDWebImageManager sharedManager] downloadImageWithURL:_model.avatarURL options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
	if (finished) {
		[_avatarImageView setCornerRadius:19 withImage:image];
	}
}];
```

这样，绘制出了圆角，也可以避免在大量cell离屏渲染的时候拖慢FPS，(支持Autolayout布局)
![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2580.PNG?raw=true)


将Demo下下来，试试使用JMRoundedCorner带来的顺滑提升。

#####0.0.4版本支持通过JMRadius设置4个角为不同的弧度，例如：

```objc
- (void)setJMRadius:(JMRadius)radius withBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
```


![](https://github.com/raozhizhen/JMRoundedCorner/blob/master/IMG_2592.PNG?raw=true)
####联系我

- QQ:337519524
- 邮箱：raozhizhen@gmail.com

####感谢

- [reviewcode.cn](http://www.reviewcode.cn/article.html?reviewId=7)

- [Getting Pixels Onto the Screen](https://www.objc.io/issues/3-views/moving-pixels-onto-the-screen/)

####已知问题

UICollectionView中直接给label设置圆角会出现label的文字不显示的Bug,暂时解决方法可以在lable下方放置一个view，设置view的圆角

如果设置view的边框出现上下左右边框宽度不一致的情况，可以试着让view的起始坐标和宽高都为整数。[IOS CGContextSetLineWidth无法设置1像素线宽？](http://my.oschina.net/lych0317/blog/126215?fromerr=65dDkPes)

因为只是绘制了一个带圆角的图片，所以不能使子视图超出部分不显示。

如果有背景图片在的话，就不会绘制背景颜色

####更新日志
- 2016/3/1   1.0.2版本 ：修复backgroundColor参数无效的BUG

- 2016/3/1   1.0.1版本 ：优化

- 2016/2/28  1.0.0版本 ：发布正式版本

- 2016/2/26  0.0.4版本 ：去掉了size参数及支持JMRadius设置4个角为不同的弧度

- 2016/2/25  0.0.3版本 ：去掉了UIImageView这个中间控件

- 2016/2/24  0.0.2版本 ：支持设置背景图片的绘制模式（cotentmode）

- 2016/2/23  0.0.1版本 ：绘制一个圆角image
