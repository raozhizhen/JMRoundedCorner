//
//  TableViewCell.h
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) UIImage *image;
+ (NSString *)cellReuseIdentifier;

@end
