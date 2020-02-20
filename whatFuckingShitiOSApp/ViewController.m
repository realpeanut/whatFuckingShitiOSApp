//
//  ViewController.m
//  firstApp
//
//  Created by 张建东 on 2020/2/8.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>//实现UITableViewDataSource协议

@end

@implementation ViewController

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
    
    UITableView *utv = [[UITableView alloc] initWithFrame:self.view.bounds];
    utv.dataSource = self;
    utv.delegate = self;
    [self.view addSubview:utv];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTNormalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCell];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;//设置每行的宽度
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GTDetailViewController * uvc = [[GTDetailViewController alloc] init];
    uvc.title = [NSString stringWithFormat:@"上一页ID=%@",@(indexPath.row)];
    uvc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:uvc animated:YES];
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
    
}




@end
