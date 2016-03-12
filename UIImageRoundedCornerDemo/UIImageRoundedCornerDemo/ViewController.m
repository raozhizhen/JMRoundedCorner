//
//  ViewController.m
//  UIImageRoundedCornerDemo
//
//  Created by jm on 16/2/23.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ViewController2.h"

@interface ViewController () <UITableViewDataSource>;

@end

@implementation ViewController {
    UITableView *_tableView;
}

- (void)loadView {
    [super loadView];
    self.title = @"使用JMRoundedCorner绘制圆角";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(action)];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:[TableViewCell cellReuseIdentifier]];
    tableView.rowHeight = 54;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)action {
    ViewController2 *VC = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell cellReuseIdentifier] forIndexPath:indexPath];
    return cell;
}

@end
