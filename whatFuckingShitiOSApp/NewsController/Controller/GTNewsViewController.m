//
//  ViewController.m
//  firstApp
//
//  Created by 张建东 on 2020/2/8.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"
#import <AVFoundation/AVFoundation.h>

@interface GTNewsViewController ()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>//实现UITableViewDataSource协议
@property(nonatomic,strong,readwrite)GTListLoader *listLoader;
@property(nonatomic,strong,readwrite)NSArray *dataArray;
@property(nonatomic,strong,readwrite)UITableView *tableView;
@end

@implementation GTNewsViewController

#pragma mark - lefe cycle

-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:({
//        UILabel *label = [[UILabel alloc] init];
//        label.text = @"hello world";
//        [label sizeToFit];
//        label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height);
//        label;
//    })];
    
    //self.view.backgroundColor = [UIColor whiteColor];
    
    //UIView *view = [[UIView alloc] init];
    //view.backgroundColor = [UIColor redColor];//设置背景颜色
    //view.frame = CGRectMake(100,100 , 100, 100);//设置frame

    //距离左边距离。距离上边距离。长。宽。
    //[self.view addSubview:view];//添加视图
    //UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    //[view addGestureRecognizer:tabGesture];
    
//    UIView *view1 = [[UIView alloc] init];
//    view1.backgroundColor = [UIColor greenColor];
//    view1.frame = CGRectMake(150, 150, 100, 100);
//    [self.view addSubview:view1];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.listLoader = [[GTListLoader alloc] init];
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTNormalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;//设置每行的宽度
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GTListItem * items = [self.dataArray objectAtIndex:indexPath.row];
    //NSLog(@"%d",items.date);
    
    
    //items.
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    //整型转为字符串
    NSString *B = [numberFormatter stringFromNumber:[NSNumber numberWithLong:items.articleId]];
    
    NSString *url = @"http://learn.laravel.com/api/article/detail?id=";
    GTDetailViewController * uvc = [[GTDetailViewController alloc] initWithStringUrl:[url stringByAppendingString:B]];
    uvc.title = [NSString stringWithFormat:@"上一页ID=%@",@(indexPath.row)];
    uvc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:uvc animated:YES];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:B];
}

-(void)pushController
{
    UIViewController *uiView = [[UIViewController alloc] init];
    uiView.view.backgroundColor = [UIColor whiteColor];
    uiView.navigationItem.title = @"navigationItem.title";
    uiView.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"蔚县吴彦祖" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:uiView animated:YES];
}

- (void)tableViewCell:(nonnull UITableViewCell *)tableViewCell clickDeleteButton:(nonnull UIButton *)deleteButton {
    
    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    [deleteView showDeleteViewFromPoint:CGPointMake(0, 0)];
    
}

-(void)_handlePlayEnd
{
    NSLog(@"列表监听到视频");
}

@end
