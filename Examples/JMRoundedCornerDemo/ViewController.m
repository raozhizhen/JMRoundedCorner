//
//  ViewController.m
//  JMRoundedCornerDemo
//
//  Created by 饶志臻 on 2016/10/7.
//  Copyright © 2016年 饶志臻. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "TableViewCell.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // http://image.raozhizhen.com/avatar.png
    self.title = @"使用JMRoundedCorner绘制圆角";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:[TableViewCell cellReuseIdentifier]];
    tableView.rowHeight = 54;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)rightBarButtonClick {
    ViewController2 *VC = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell cellReuseIdentifier] forIndexPath:indexPath];
    cell.avatarURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://oepjvpu5g.qnssl.com/avatar%li.jpg", indexPath.row % 20]];
    return cell;
}

@end
