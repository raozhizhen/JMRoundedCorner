//
//  TableViewCell.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "TableViewCell.h"
#import "UIView+RoundedCorner.h"

@interface TableViewCell ()

@property (nonatomic, strong)UIImageView *avatarView;

@end

@implementation TableViewCell {
    UIButton *_button;
    UILabel *_label;
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
    
    UIImage *avatar = [UIImage imageNamed:@"avatar.jpg"];
    
    _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 40, 40)];
    [_avatarView setCornerRadius:20 withBorderColor:[UIColor redColor] borderWidth:1 backgroundColor:[UIColor whiteColor] backgroundImage:avatar ContentMode:UIViewContentModeScaleToFill size:CGSizeMake(40, 40)];
    [self.contentView addSubview:_avatarView];
    
    CGFloat viewWidth = ([UIScreen mainScreen].bounds.size.width - 80) / 2;
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(60, 7, viewWidth, 40)];
    [_button setTitle:@"这是一个button" forState:UIControlStateNormal];
    [_button setCornerRadius:10 withImage:[self imageWithColor:[UIColor redColor]] size:CGSizeMake(viewWidth, 40)];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    _button.titleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_button];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(70 + viewWidth, 7, viewWidth, 40)];
    _label.text = @"这是一个lable";
    [_label setCornerRadius:10 withBorderColor:[UIColor redColor] borderWidth:1 size:CGSizeMake(viewWidth, 40)];
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
