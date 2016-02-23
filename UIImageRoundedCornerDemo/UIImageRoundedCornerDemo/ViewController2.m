//
//  ViewController2.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "ViewController2.h"
#import "TableViewCell2.h"
#import "LPFPSLabel.h"

@interface ViewController2 () <UITableViewDataSource>;

@end

@implementation ViewController2 {
    UITableView *_tableView;
}

- (void)loadView {
    [super loadView];
    self.title = @"使用layer.cornerRadius";

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tableView registerClass:[TableViewCell2 class] forCellReuseIdentifier:[TableViewCell2 cellReuseIdentifier]];
    tableView.rowHeight = 44;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    LPFPSLabel *fpsLabel = [[LPFPSLabel alloc] initWithFrame:CGRectMake(10, 74, 50, 30)];
    [fpsLabel sizeToFit];
    [self.view addSubview:fpsLabel];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell2 cellReuseIdentifier] forIndexPath:indexPath];
    return cell;
}

@end
