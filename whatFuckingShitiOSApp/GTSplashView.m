//
//  GTSplashView.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/3/1.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTSplashView.h"
#import "GTScreen.h"

@interface GTSplashView()
    
@property(nonatomic,strong,readwrite) UIButton * stopButton;

@end

@implementation GTSplashView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"sp"];
        _stopButton = [[UIButton alloc] initWithFrame:UICGRect(330, 100, 60, 40)];
        _stopButton.backgroundColor = [UIColor blueColor];
        [_stopButton setTitle:@"跳过" forState:UIControlStateNormal];
        [_stopButton addTarget:self action:@selector(_remove) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_stopButton];
        self.userInteractionEnabled = YES;//允许用户点击
    }
    return self;
}

-(void)_remove
{
    [self removeFromSuperview];//从父view移除
}


@end
