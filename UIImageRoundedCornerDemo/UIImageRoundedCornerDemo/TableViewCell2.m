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
    UILabel *_label2;
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
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 6, 30, 30)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = image;
    _imageView.layer.cornerRadius = 15;
    _imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_imageView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 6, 100, 30)];
    _label.text = @"一个label";
    _label.font = [UIFont systemFontOfSize:12];
    _label.textColor = [UIColor whiteColor];
    _label.layer.cornerRadius = 10;
    _label.layer.masksToBounds = YES;
    _label.backgroundColor = [UIColor redColor];
    _label.textAlignment = NSTextAlignmentCenter;
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 6, 130, 30)];
    _label2.text = @"也是一个lable";
    _label2.backgroundColor = [UIColor whiteColor];
    _label2.layer.cornerRadius = 10;
    _label2.layer.borderWidth = 1;
    _label2.layer.borderColor = [UIColor redColor].CGColor;
    _label2.layer.masksToBounds = YES;
    _label2.font = [UIFont systemFontOfSize:12];
    _label2.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_label];
    
    [self.contentView addSubview:_label2];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(self);
}

@end
