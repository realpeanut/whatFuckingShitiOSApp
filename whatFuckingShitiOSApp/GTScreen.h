//
//  GTScreen.h
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/29.
//  Copyright © 2020 张建东. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define UI(x) UIAdapter(x)

#define UICGRect(x,y,width,height) UICGRectAdapter(x,y,width,height)
static inline NSInteger UIAdapter (float x)
{
    //屏幕宽度按比例适配
    CGFloat scale = 414/SCREEN_WIDTH;
    return (NSInteger)x/scale;
}

static inline CGRect UICGRectAdapter (x,y,width,height)
{
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface GTScreen : NSObject

@end

NS_ASSUME_NONNULL_END
