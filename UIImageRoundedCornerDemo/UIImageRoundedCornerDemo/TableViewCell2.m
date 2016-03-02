//
//  TableViewCell2.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "TableViewCell2.h"

@implementation TableViewCell2 {
    UIImageView *_imageView;
    UILabel *_label;
    UIButton *_button;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    
    UIImage *image = [UIImage imageNamed:@"avatar.jpg"];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 40, 40)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = image;
    _imageView.layer.borderWidth = 0.5;
    _imageView.layer.borderColor = [UIColor redColor].CGColor;
    _imageView.layer.cornerRadius = 20;
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.shouldRasterize = YES;
    _imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    [self.contentView addSubview:_imageView];
    
    CGFloat viewWidth = ([UIScreen mainScreen].bounds.size.width - 80) / 2;
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(60, 7, viewWidth, 40)];
    [_button setTitle:@"这是一个button" forState:UIControlStateNormal];
    _button.layer.cornerRadius = 10;
    _button.layer.masksToBounds = YES;
    _button.layer.shouldRasterize = YES;
    _button.layer.rasterizationScale = [UIScreen mainScreen].scale;
    [_button setBackgroundImage:[self imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    _button.titleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_button];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(70 + viewWidth, 7, viewWidth, 40)];
    _label.text = @"这是一个label";
    _label.backgroundColor = [UIColor whiteColor];
    _label.layer.cornerRadius = 10;
    _label.layer.borderWidth = 0.5;
    _label.layer.borderColor = [UIColor redColor].CGColor;
    _label.layer.masksToBounds = YES;
    _label.layer.shouldRasterize = YES;
    _label.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(self);
}

@end
