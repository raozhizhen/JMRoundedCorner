//
//  ViewController2.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"
#import "TableViewCell2.h"

@interface ViewController2 () <UITableViewDataSource>;

@end

@implementation ViewController2 {
    UITableView *_tableView;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"使用layer.cornerRadius";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(action)];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tableView registerClass:[TableViewCell2 class] forCellReuseIdentifier:[TableViewCell2 cellReuseIdentifier]];
    tableView.rowHeight = 54;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)action {
    ViewController3 *VC = [[ViewController3 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell2 cellReuseIdentifier] forIndexPath:indexPath];
    return cell;
}

@end
