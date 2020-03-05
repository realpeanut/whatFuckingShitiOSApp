//
//  GTMediator.h
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/3/1.
//  Copyright © 2020 张建东. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTMediator : NSObject

//target_action
+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUrl;

//urlscheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *parameters);

+(void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processblock;

+(void)openUrl:(NSString *)url params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
