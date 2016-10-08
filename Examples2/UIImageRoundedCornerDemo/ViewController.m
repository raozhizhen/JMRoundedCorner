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
#import "SDWebImageManager.h"
#import "UIImage+RoundedCorner.h"
#import "SDWebImageDownloader.h"

@interface ViewController () <UITableViewDataSource>;

@end

@implementation ViewController {
    UITableView *_tableView;
    NSMutableArray *_objects;
}

- (void)loadView {
    [super loadView];
    self.title = @"使用JMRoundedCorner绘制圆角";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(action)];
    
    [SDWebImageManager sharedManager].imageDownloader.username = @"httpwatch";
    [SDWebImageManager sharedManager].imageDownloader.password = @"httpwatch01";
    
    _objects = [[NSMutableArray alloc] init];
    
    _objects = [NSMutableArray arrayWithObjects:
                @"http://www.httpwatch.com/httpgallery/authentication/authenticatedimage/default.aspx?0.35786508303135633",     // requires HTTP auth, used to demo the NTLM auth
                @"http://assets.sbnation.com/assets/2512203/dogflops.gif",
                @"https://raw.githubusercontent.com/liyong03/YLGIFImage/master/YLGIFImageDemo/YLGIFImageDemo/joy.gif",
                @"http://www.ioncannon.net/wp-content/uploads/2011/06/test2.webp",
                @"http://www.ioncannon.net/wp-content/uploads/2011/06/test9.webp",
                @"http://littlesvr.ca/apng/images/SteamEngine.webp",
                @"http://littlesvr.ca/apng/images/world-cup-2014-42.webp",
                @"https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png",
                nil];
    
    for (int i=0; i<100; i++) {
        [_objects addObject:[NSString stringWithFormat:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage%03d.jpg", i]];
    }
    
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
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCell cellReuseIdentifier] forIndexPath:indexPath];
    cell.imageURL = _objects[indexPath.row];
    //添加占位图
//    cell.image = [UIImage imageNamed:@"avatar.jpg"];
    
    //下载完之后设置圆角 image
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    [manager downloadImageWithURL:_objects[indexPath.row]
//                          options:0
//                         progress:nil
//                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//                            if (image) {
//                                cell.image = image;
//                            }
//                        }];
//    if ((indexPath.row & 1) == 1) {
//        
//        cell.image = [UIImage imageNamed:@"avatar.jpg"];
//    } else {
//        cell.image = [UIImage imageNamed:@"luhu"];
//    }
    return cell;
}

@end
