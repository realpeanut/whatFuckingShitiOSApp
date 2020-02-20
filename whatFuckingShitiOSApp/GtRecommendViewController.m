//
//  GtRecommendViewController.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/10.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GtRecommendViewController.h"

@interface GtRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GtRecommendViewController


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];//设置主视图背景色
        self.tabBarItem.title = @"我";//设置下方tabBarItem标题
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *uiScrollView   = [[UIScrollView alloc] initWithFrame:self.view.bounds];//创建uiScrollView视图
    uiScrollView.backgroundColor = [UIColor lightGrayColor];//设置视图背景颜色
    uiScrollView.contentSize     = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);//设置视图布局大小
    uiScrollView.showsHorizontalScrollIndicator = NO;//停止水平滚动
    NSArray *colorArray          = @[[UIColor yellowColor],[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor]];
    for (int i=0; i<5; i++)
    {
        //写法1
        [uiScrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(uiScrollView.bounds.size.width*i, 0, uiScrollView.bounds.size.width, uiScrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];
            
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
                view.backgroundColor = [UIColor whiteColor];
                UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickFunc)];
                tabGesture.delegate = self;
                //添加手势
                [view addGestureRecognizer:tabGesture];
                view;
            })];
            view;
        })];
        
    }
    uiScrollView.delegate = self;
    //uiScrollView.pagingEnabled = YES;//是否有翻页效果
    [self.view addSubview:uiScrollView];//在主视图添加子视图
}

-(void)clickFunc
{
    NSLog(@"clickFunc");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return NO;//控制注册的手势是否执行
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView//scroll滑动时触发
{
//    NSLog(@"scrollViewDidScroll---%f",scrollView.contentOffset.y);
}


// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");//开始滑动
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");//结束滑动
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

@end
