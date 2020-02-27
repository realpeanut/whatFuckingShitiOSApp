//
//  GTVedioCoverViewCollecion.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/27.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTVedioCoverViewCollecion.h"
#import <AVFoundation/AVFoundation.h>


@interface GTVedioCoverViewCollecion()

@property(nonatomic,strong,readwrite)AVPlayer *avplayer;
@property(nonatomic,strong,readwrite)AVPlayerItem *vedioItem;
@property(nonatomic,strong,readwrite)AVPlayerLayer *avplayerlaver;
@property(nonatomic,strong,readwrite)UIImageView *converView;
@property(nonatomic,strong,readwrite)UIImageView *playButton;
@property(nonatomic,strong,readwrite)NSString *vedioUrl;

@end

@implementation GTVedioCoverViewCollecion

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _converView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
            _converView;
        })];
        [_converView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width -50 )/2,(frame.size.height -50 )/2,50,50)];
            _playButton.image = [UIImage imageNamed:@"video@2x"];
            _playButton;
        })];
        UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tabToPlay)];
        [self addGestureRecognizer:tabGesture];
        //注册事件监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
        
    }
    return self;
}

-(void)dealloc
{
    //本类销毁时，移除事件
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_vedioItem removeObserver:self forKeyPath:@"status"];
    NSLog(@"本类销毁，移除事件");
}

-(void)_tabToPlay
{
    NSLog(@"点击");
    NSURL *vedioUrl = [NSURL URLWithString:_vedioUrl];
    //创建播放资源
    AVAsset *avaset = [AVAsset assetWithURL:vedioUrl];
    _vedioItem = [AVPlayerItem playerItemWithAsset:avaset];
    //KVO监听_vedioItem的status 属性
    [_vedioItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //生成播放器
    _avplayer = [AVPlayer playerWithPlayerItem:_vedioItem];
    //提供画面展示
    _avplayerlaver = [AVPlayerLayer playerLayerWithPlayer:_avplayer];
    //设置画面大小
    _avplayerlaver.frame = _converView.bounds;
    [_converView.layer addSublayer:_avplayerlaver];
    
}

-(void)layoutWithVideoCoverUrl:(NSString *)vedioCoverUrl vedioUrl:(NSString *)vedioUrl
{
    _converView.image = [UIImage imageNamed:vedioCoverUrl];
    _playButton.image = [UIImage imageNamed:@"home"];
    
    _vedioUrl = vedioUrl;
}

-(void)_handlePlayEnd
{
    NSLog(@"播放结束，接收结束事件");
    _avplayer = nil;
    _vedioItem = nil;
    [_avplayerlaver removeFromSuperlayer];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        //是否处于AVPlayerItemStatusReadyToPlay状态
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            //进行播放
            [_avplayer play];
            NSLog(@"监听成功，进行播放");
        } else {
            NSLog(@"资源加载失败");
        }
        
    }
}


@end
