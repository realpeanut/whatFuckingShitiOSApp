//
//  AppDelegate.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/8.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTPicViewController.h"
#import "GtRecommendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    UIViewController *controller1 = [[UIViewController alloc] init];

    //UIViewController *controller1 = [[UIViewController alloc] init];
    controller1.view.backgroundColor = [UIColor whiteColor];
    controller1.tabBarItem.title = @"微信";
    //controller1.tabBarItem.image = [UIImage imageNamed:@""];

    UIViewController *controller2 = [[GTNewsViewController alloc] init];
    controller2.view.backgroundColor = [UIColor greenColor];
    controller2.tabBarItem.title = @"通讯录";

    GTPicViewController *gtpvc = [[GTPicViewController alloc] init];
    GtRecommendViewController *controller4 = [[GtRecommendViewController alloc] init];
    

    [tabbarController setViewControllers:@[controller2,controller1, gtpvc, controller4]];
    tabbarController.delegate = self;
        
    UINavigationController * uiNavigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    self.window.rootViewController = uiNavigationController;
    [self.window makeKeyAndVisible];
        
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"自定义didselect");
}


#pragma mark - UISceneSession lifecycle





@end
