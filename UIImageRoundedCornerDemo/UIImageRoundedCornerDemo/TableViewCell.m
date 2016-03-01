//
//  TableViewCell.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "TableViewCell.h"
#import "UIView+RoundedCorner.h"
#import "Masonry.h"

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
    [_avatarView setJMRadius:JMRadiusMake(20, 0, 0, 20) withBorderColor:[UIColor redColor] borderWidth:0.5 backgroundColor:[UIColor whiteColor] backgroundImage:avatar contentMode:UIViewContentModeScaleToFill];
    [self.contentView addSubview:_avatarView];
    
    NSInteger viewWidth = ([UIScreen mainScreen].bounds.size.width - 78) / 2;
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(60, 7, viewWidth, 40)];
    [_button setTitle:@"这是一个button" forState:UIControlStateNormal];
    [_button setJMRadius:JMRadiusMake(10, 0, 10, 0) withImage:[self imageWithColor:[UIColor redColor]]];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    _button.titleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_button];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(60, 7, viewWidth, 40)];
    _label.text = @"这是一个label";
    [_label setJMRadius:JMRadiusMake(0, 10, 0, 10) withBorderColor:[UIColor redColor] borderWidth:0.5];
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];
    
    [self updateConstraints];
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_button.mas_right).offset(2);
        make.top.equalTo(self.contentView).offset(7);
        make.height.mas_equalTo(40);
        make.right.equalTo(self.contentView).offset(-10);
    }];
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
