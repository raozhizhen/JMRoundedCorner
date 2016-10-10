# JMRoundedCorner


[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/raozhizhen/JMRoundedCorner/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/JMRoundedCorner.svg?style=flat)](http://cocoapods.org/?q=JMRoundedCorner)&nbsp;
[![SUPPORT](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
[![BLOG](https://img.shields.io/badge/blog-raozhizhen.com-orange.svg?style=flat)](http://raozhizhen.com)&nbsp;


####避免离屏渲染

如果你的 view 不需要让子视图超出部分不显示，且不需要给 view 的 image 绘制圆角，

可以查看 cornerRadius 属性的注释：

	By default, the corner radius does not apply to the image in the layer’s contents property; it applies only to the background color and border of the layer. However, setting the masksToBounds property to true causes the content to be clipped to the rounded corners.

这个属性会影响 layer 的背景颜色和 border，所以如下代码即可避免离屏渲染。

```objc	
view.layer.cornerRadius = radius;
view.layer.backgroundColor = backgroundColor.CGColor;
```

####使用 JMRoundedCorner 来绘制圆角


	platform :ios, '7.0'
	
	pod 'JMRoundedCorner' 
	pod 'YYWebImage', :git => 'https://github.com/raozhizhen/YYWebImage.git', :tag => '1.0.5'

	#import "JMRoundedCorner.h"


#####代码示例

```objc
[_avatarView jm_setImageWithCornerRadius:10 image:[UIImage imageNamed:@"avatar"]];
```

```objc
[_avatarView jm_setImageWithCornerRadius:20 imageURL:_avatarURL placeholder:@"avatar" size:CGSizeMake(40, 40)];
```

##### 支持通过 JMRadius 设置4个角为不同的弧度，角度优先级为左上 > 右上 > 左下 > 右下，

```objc
    [_avatarView jm_setImageWithJMRadius:JMRadiusMake(20, 20, 20, 20)
                                imageURL:_avatarURL 
                             placeholder:@"avatar"
                             borderColor:[UIColor redColor]
                             borderWidth:1
                         backgroundColor:[UIColor blueColor]
                             contentMode:UIViewContentModeScaleAspectFill
                                    size:CGSizeMake(40, 40)];

```

####联系我

- QQ:337519524
- 邮箱：raozhizhen@gmail.com

####感谢

- [reviewcode.cn](http://www.reviewcode.cn/article.html?reviewId=7)

- [Getting Pixels Onto the Screen](https://www.objc.io/issues/3-views/moving-pixels-onto-the-screen/)

####性能上的优缺点

优点：没有了离屏渲染，调整了 image 的像素大小以避免不必要的缩放

缺点：会造成图层混合，且因为只是绘制了一个带圆角的图片，所以不能使子视图超出圆角部分不显示。

####注意事项

内存会持续提升，是正常现象，点击 home 键内存会回到正常水平，并非内存泄漏，只是绘制的缓存，在内存不足时会自动释放。

不要设置 view 的 backgroundColor，需要设置的话可以通过带 backgroundColor 参数的接口进行设置，例如：

```objc
- (void)jm_setImageWithCornerRadius:(CGFloat)radius
                        borderColor:(UIColor *)borderColor
                        borderWidth:(CGFloat)borderWidth
                    backgroundColor:(UIColor *)backgroundColor;
- ```

[控制器输出以下错误，这是 Xcode-7 的 BUG](https://forums.developer.apple.com/thread/13683)。
```objc
<Error>: CGContextSaveGState: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
```

####更新日志
- 2016/10/10 1.9.0 版本 : 依赖 **[YYWebImage](https://github.com/ibireme/YYWebImage)** 实现网络图片圆角处理和圆角图片缓存，1.9 版本属于测试版，稳定后会发布 2.0.0 版本。

- 2016/4/25  1.2.1 版本 : 使用 NSOperationQueue 代替 dispatch_queue，当重复设置圆角的时候会自动 cancel 上一次操作，感谢 **[kudocc](https://github.com/kudocc)** 的 pull request。

- 2016/3/12  1.1.0 版本 : 接口带上了 jm_ 前缀，JMRadius 添加圆角优先级。

- 2016/3/3   1.0.3 版本 : 修复 label 里如果没有汉字，文字就不显示的 BUG，以及做了使 view 落在像素点上的优化。

- 2016/2/28  1.0.0 版本 ：发布正式版本

- 2016/2/26  0.0.4 版本 ：去掉了 size 参数及支持 JMRadius 设置4个角为不同的弧度

- 2016/2/25  0.0.3 版本 ：去掉了 UIImageView 这个中间控件

- 2016/2/24  0.0.2 版本 ：支持设置背景图片的绘制模式（cotentmode）

- 2016/2/23  0.0.1 版本 ：绘制一个圆角 image

####许可证
JMRoundedCorner 使用 MIT 许可证，详情见 LICENSE 文件。
