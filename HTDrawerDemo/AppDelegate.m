//
//  AppDelegate.m
//  HTDrawerDemo
//
//  Created by admin on 2018/7/3.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "AppDelegate.h"
#import "CenterFirstViewController.h"
#import "CenterSecondViewController.h"
#import "MenuLeftViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CenterFirstViewController *centerVC = [[CenterFirstViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:centerVC];
    MenuLeftViewController *leftMenuViewController = [[MenuLeftViewController alloc] init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:nil];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"MenuBackground"];
    sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    sideMenuViewController.delegate = self;
    // Content视图缩放
    sideMenuViewController.contentViewScaleValue = 1;
    //在默认宽度基础上加减
    sideMenuViewController.contentViewInPortraitOffsetCenterX = 50;
    // Menu视图弹出动画属性 默认为缩放动画CGAffineTransformMakeScale(1.7f, 1.07f);
    sideMenuViewController.menuViewControllerTransformation = CGAffineTransformMakeScale(1.0f, 1.0f);
//    sideMenuViewController.menuViewControllerTransformation =  CGAffineTransformMakeTranslation(-([UIScreen mainScreen].bounds.size.width/2.f), 0);
    // 侧滑对象的panGestureEnabled 是否开启手势
    sideMenuViewController.panGestureEnabled = YES;
    // 侧滑对象的panFromEdge 是否在边界有侧滑手势
    sideMenuViewController.panFromEdge = NO;
    // 阴影
    sideMenuViewController.contentViewShadowEnabled = YES;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 10;
    //视差
//    sideMenuViewController.parallaxEnabled = NO;
//    sideMenuViewController.parallaxMenuMinimumRelativeValue = 20;
//    sideMenuViewController.parallaxMenuMaximumRelativeValue = 50;
//    sideMenuViewController.parallaxContentMinimumRelativeValue = 10;
//    sideMenuViewController.parallaxContentMaximumRelativeValue = 20;
    
//    sideMenuViewController.fadeMenuView = YES;
//    sideMenuViewController.contentViewFadeOutAlpha = 1;
    
    self.window.rootViewController = sideMenuViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}
@end
