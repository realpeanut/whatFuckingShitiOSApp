//
//  GTMediator.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/3/1.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTMediator.h"

@implementation GTMediator

+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUrl
{
//    GTDetailViewController * uvc = [[GTDetailViewController alloc] initWithStringUrl:detailUrl];
//    return uvc;
    //反射机制 ，runtime 解耦
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithStringUrl:") withObject:detailUrl];
    return controller;
    
}

+(NSMutableDictionary *)mediatorCache
{
    static NSMutableDictionary *cache;
    static dispatch_once_t onecToken;
    dispatch_once(&onecToken,^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+(void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processblock
{
    if (scheme && processblock) {
        [[[self class] mediatorCache] setObject:processblock forKey:scheme];
    }
}

+(void)openUrl:(NSString *)url params:(NSDictionary *)params
{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

@end
