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
    UITextField *_textField;
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
        
    _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 50, 50)];
    [_avatarView jm_setJMRadius:JMRadiusMake(20, 20, 20, 20) withBorderColor:[UIColor redColor] borderWidth:0 backgroundColor:[UIColor blueColor] backgroundImage:[UIImage imageNamed:@"avatar.jpg"] contentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:_avatarView];
    
    NSInteger viewWidth = ([UIScreen mainScreen].bounds.size.width - 78) / 3;
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(60 + 0.22, 7, viewWidth + 0.34, 40)];
    [_button setTitle:@"button" forState:UIControlStateNormal];
    [_button jm_setJMRadius:JMRadiusMake(10, 0, 10, 0) withImage:[UIImage imageNamed:@"avatar.jpg"]];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_button];
    
    _label = [[UILabel alloc] init];
    _label.text = @"label";
    [_label jm_setJMRadius:JMRadiusMake(0, 10, 0, 10) withBorderColor:[UIColor redColor] borderWidth:0.5];
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];
    
    _textField = [[UITextField alloc] init];
    _textField.text = @"textField";
    [_textField jm_setJMRadius:JMRadiusMake(10, 20, 10, 20) withBorderColor:[UIColor redColor] borderWidth:0.5];
    _textField.font = [UIFont systemFontOfSize:12];
    _textField.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_textField];
    
    [self updateConstraints];
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_button.mas_right).offset(2);
        make.top.equalTo(self.contentView).offset(7);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(100);
    }];
    
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right).offset(2);
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(7);
        make.height.mas_equalTo(40);
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
