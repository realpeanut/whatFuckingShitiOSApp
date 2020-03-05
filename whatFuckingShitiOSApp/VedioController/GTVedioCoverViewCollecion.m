//
//  GTVedioCoverViewCollecion.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/27.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTVedioCoverViewCollecion.h"
#import "GTVedioPlayer.h"
#import "GTVedioToolBar.h"


@interface GTVedioCoverViewCollecion()

@property(nonatomic,strong,readwrite)UIImageView *coverView;
@property(nonatomic,strong,readwrite)UIImageView *playButton;
@property(nonatomic,strong,readwrite)NSString *vedioUrl;
@property(nonatomic,strong,readwrite)GTVedioToolBar *toolBar;

@end

@implementation GTVedioCoverViewCollecion

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height-GTVedioToolBarHeight)];
            _coverView;
        })];
        //播放按钮
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width -50 )/2,(frame.size.height -50 -GTVedioToolBarHeight)/2,50,50)];
            _playButton;
        })];
        [self addSubview:({
            _toolBar = [[GTVedioToolBar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVedioToolBarHeight)];
            _toolBar;
        })];
        
        UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tabToPlay)];
        [self addGestureRecognizer:tabGesture];
    }
    return self;
}

-(void)dealloc
{
    //本类销毁时，移除事件
    
}

-(void)_tabToPlay
{
    NSLog(@"点击");
    [[GTVedioPlayer Player] playVideoWithUrl:_vedioUrl attachView:_coverView];
    
}

-(void)layoutWithVideoCoverUrl:(NSString *)vedioCoverUrl vedioUrl:(NSString *)vedioUrl
{
    _coverView.image  = [UIImage imageNamed:vedioCoverUrl];
    _coverView.clipsToBounds = YES;
    
    _coverView.contentMode = UIViewContentModeScaleAspectFill;
    _coverView.backgroundColor = [UIColor blueColor];
    _playButton.image = [UIImage imageNamed:@"888"];
    _vedioUrl = vedioUrl;
    [_toolBar layoutWithModel:nil];
}

@end
