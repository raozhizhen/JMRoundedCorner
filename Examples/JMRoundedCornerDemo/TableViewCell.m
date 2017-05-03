//
//  TableViewCell.m
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/7.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import "TableViewCell.h"
#import "JMRoundedCorner.h"
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
    [_button jm_setImageWithJMRadius:JMRadiusMake(10, 2, 10, 2) image:[UIImage imageNamed:@"avatar"] borderColor:[UIColor blueColor] borderWidth:1 backgroundColor:[UIColor whiteColor] contentMode:UIViewContentModeScaleAspectFill size:CGSizeMake(viewWidth + 0.34, 40) forState:UIControlStateNormal completion:nil];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_button];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(70 + viewWidth , 7, viewWidth, 40)];
    _label.text = @"label";
    [_label jm_setImageWithJMRadius:JMRadiusMake(2, 10, 2, 10) borderColor:[UIColor redColor] borderWidth:0.5 backgroundColor:[UIColor whiteColor]];
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];
}

- (void)setAvatarURL:(NSURL *)avatarURL {
    _avatarURL = avatarURL;
    
//    [_avatarView jm_setImageWithCornerRadius:20 imageURL:_avatarURL placeholder:@"avatar" size:CGSizeMake(40, 40)];
    
    [_avatarView jm_setImageWithJMRadius:JMRadiusMake(20, 20, 20, 20)
                                imageURL:_avatarURL
                             placeholder:[UIImage imageNamed:@"avatar"]
                             borderColor:[UIColor redColor]
                             borderWidth:1
                         backgroundColor:[UIColor blueColor]
                             contentMode:UIViewContentModeScaleAspectFill
                                    size:CGSizeMake(40, 40)];
    
    [_button jm_setImageWithJMRadius:JMRadiusMake(2, 10, 2, 10) imageURL:_avatarURL placeholder:[UIImage imageNamed:@"avatar"] borderColor:[UIColor redColor] borderWidth:1 backgroundColor:nil contentMode:UIViewContentModeScaleAspectFill size:_button.bounds.size forState:UIControlStateHighlighted];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(self);
}

@end
