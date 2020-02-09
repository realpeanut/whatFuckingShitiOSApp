//
//  AppDelegate.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/8.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    ViewController *vc = [[ViewController alloc] init];

    //UIViewController *controller1 = [[UIViewController alloc] init];
    //controller1.view.backgroundColor = [UIColor redColor];
    vc.tabBarItem.title = @"微信";
    //controller1.tabBarItem.image = [UIImage imageNamed:@""];

    UIViewController *controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = [UIColor greenColor];
    controller2.tabBarItem.title = @"通讯录";

    UIViewController *controller3 = [[UIViewController alloc] init];
    controller3.view.backgroundColor = [UIColor blueColor];
    controller3.tabBarItem.title = @"发现";

    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor yellowColor];
    controller4.tabBarItem.title = @"我";

    [tabbarController setViewControllers:@[vc, controller2, controller3, controller4]];
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
