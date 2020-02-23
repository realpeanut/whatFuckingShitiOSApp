//
//  GTDeleteCellView.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/20.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView()

@property(strong,nonatomic,readwrite) UIView *backgroundView;

@property(strong,nonatomic,readwrite) UIButton *deleteButton;

@end

@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            //增加点击手势
            [_backgroundView addGestureRecognizer:({
                //点击后执行dissmissDeleteView  函数 移除视图
                UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissDeleteView)];
                gesture;
            })];
            _backgroundView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(_clickButtom) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

-(void)showDeleteViewFromPoint:(CGPoint)point
{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    //添加动画  1秒的时间。self.deleteButton.frame  变为CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
//    }];
    //UIViewAnimationOptionCurveEaseInOut  前后慢，中间快
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished) {
        //动画做完之后处理哪些逻辑
        NSLog(@"动画完成");
    }];
}

-(void)dissmissDeleteView
{
    [self removeFromSuperview];
}

-(void)_clickButtom
{
    [self removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
