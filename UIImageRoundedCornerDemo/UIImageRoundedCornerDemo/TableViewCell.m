//
//  TableViewCell.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImage+RoundedCorner.h"

@interface TableViewCell ()

@property (nonatomic, strong)UIImageView *avatarView;

@end

@implementation TableViewCell {
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
    
    UIImage *avatar = [UIImage imageNamed:@"avatar.jpg"];
    
    _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 6, 30, 30)];
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [avatar jm_imageWithRoundedCornersAndSize:CGSizeMake(30, 30) andCornerRadius:15];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.avatarView.image = image;
        });
    });
    [self.contentView addSubview:_avatarView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 6, 100, 30)];
    _label.text = @"一个label";
    _label.font = [UIFont systemFontOfSize:12];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 6, 130, 30)];
    _label2.text = @"也是一个lable";
    _label2.font = [UIFont systemFontOfSize:12];
    _label2.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *labelRoundedCornerView = [[UIImageView alloc] initWithFrame:_label.frame];
    labelRoundedCornerView.image = [UIImage jm_imageWithRoundedCornersAndSize:CGSizeMake(100, 30) andCornerRadius:10 andColor:[UIColor redColor]];
    [self.contentView addSubview:labelRoundedCornerView];
    [self.contentView addSubview:_label];
    
    UIImageView *labelRoundedCornerView2 = [[UIImageView alloc] initWithFrame:_label2.frame];
    labelRoundedCornerView2.image = [UIImage jm_imageWithRoundedCornersAndSize:CGSizeMake(100, 30) CornerRadius:10 borderColor:[UIColor redColor] borderWidth:1];
    [self.contentView addSubview:labelRoundedCornerView2];
    [self.contentView addSubview:_label2];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass(self);
}

@end
