//
//  TableViewCell.m
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/7.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import "TableViewCell.h"
#import "UIView+RoundedCorner.h"
#import "UIImageView+YYWebImage.h"

@interface TableViewCell ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    
    _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 40, 40)];
    [self.contentView addSubview:_avatarView];
    
    NSInteger viewWidth = ([UIScreen mainScreen].bounds.size.width - 78) / 2;
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(60 + 0.22, 7, viewWidth + 0.34, 40)];
    [_button setTitle:@"button" forState:UIControlStateNormal];
    [_button jm_setJMRadius:JMRadiusMake(10, 0, 10, 0) image:[UIImage imageNamed:@"avatar"]];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_button];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(70 + viewWidth , 7, viewWidth, 40)];
    _label.text = @"label";
    [_label jm_setJMRadius:JMRadiusMake(0, 10, 0, 10) borderColor:[UIColor redColor] borderWidth:0.5 backgroundColor:[UIColor whiteColor]];
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];
}

- (void)setAvatarURL:(NSURL *)avatarURL {
    _avatarURL = avatarURL;
    
    [_avatarView yy_setImageWithURL:avatarURL placeholder:nil options:kNilOptions manager:nil progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        UIImage *newImage = [image jm_setRadiu:15 size:CGSizeMake(40, 40)];
        return newImage;
    } completion:nil];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(self);
}

@end
