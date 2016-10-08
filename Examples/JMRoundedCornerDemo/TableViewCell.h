//
//  TableViewCell.h
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/7.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) NSURL *avatarURL;

+ (NSString *)cellReuseIdentifier;

@end
