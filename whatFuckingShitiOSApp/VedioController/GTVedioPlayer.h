//
//  GTVedioPlayer.h
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/28.
//  Copyright © 2020 张建东. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVedioPlayer : NSObject
//单例
+(GTVedioPlayer *)Player;

-(void)playVideoWithUrl:(NSString *)vedioUrl attachView:(UIImageView *)attachView;

@end

NS_ASSUME_NONNULL_END
