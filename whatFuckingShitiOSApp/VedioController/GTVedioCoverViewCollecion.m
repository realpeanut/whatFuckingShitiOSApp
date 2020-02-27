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
        
    }
    return self;
}

-(void)_tabToPlay
{
    NSLog(@"点击");
    NSURL *vedioUrl = [NSURL URLWithString:_vedioUrl];
    //创建播放资源
    AVAsset *avaset = [AVAsset assetWithURL:vedioUrl];
    AVPlayerItem *vedioItem = [AVPlayerItem playerItemWithAsset:avaset];
    //生成播放器
    AVPlayer *avplayer = [AVPlayer playerWithPlayerItem:vedioItem];
    //提供画面展示
    AVPlayerLayer *avplayerlaver = [AVPlayerLayer playerLayerWithPlayer:avplayer];
    //设置画面大小
    avplayerlaver.frame = _converView.bounds;
    [_converView.layer addSublayer:avplayerlaver];
    [avplayer play];
}

-(void)layoutWithVideoCoverUrl:(NSString *)vedioCoverUrl vedioUrl:(NSString *)vedioUrl
{
    _converView.image = [UIImage imageNamed:vedioCoverUrl];
    _playButton.image = [UIImage imageNamed:@"home"];
    
    _vedioUrl = vedioUrl;
}


@end
