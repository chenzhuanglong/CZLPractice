//
//  CZLAppDelegate.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLAppDelegate.h"
#import "CZLTabBarController.h"

@implementation CZLAppDelegate

// -----------------------------------------------------------------------------
// 当应用程序启动完毕的时候就会调用(系统自动调用)
// -----------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [CZLTabBarController new];
    
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    return YES;
}

// -------------------------------------------------------------------------------
// 即将失去活动状态的时候调用(失去焦点, 不可交互)
// -------------------------------------------------------------------------------
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

// -------------------------------------------------------------------------------
// 应用程序即将被销毁的时候会调用该方法
// 注意:如果应用程序处于挂起状态的时候无法调用该方法
// -------------------------------------------------------------------------------
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
}

// -------------------------------------------------------------------------------
// 应用程序即将进入前台的时候调用
// 一般在该方法中恢复应用程序的数据,以及状态
// -------------------------------------------------------------------------------
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
}

// --------------------------------------------------------------------------------
// 重新获取焦点(能够和用户交互)
// --------------------------------------------------------------------------------
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

// ---------------------------------------------------------------------------------
// 应用程序即将被销毁的时候会调用该方法
// 注意:如果应用程序处于挂起状态的时候无法调用该方法
// ---------------------------------------------------------------------------------
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// ---------------------------------------------------------------------------------
// 当一个运行着的应用程序收到一个远程的通知时执行 (iOS10以下)
// ---------------------------------------------------------------------------------
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
}

// ---------------------------------------------------------------------------------
// iOS10新增：处理前台收到通知的代理方法
// ---------------------------------------------------------------------------------
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
}

// ---------------------------------------------------------------------------------
// iOS10新增：处理后台点击通知的代理方法
// ---------------------------------------------------------------------------------
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    
    
}

// ----------------------------------------------------------------------------------
// 请求委托打开一个URL资源（IOS9.0及以上）
// ----------------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return YES;
}

// ----------------------------------------------------------------------------------
// 请求委托打开一个URL资源（IOS9.0及以下）
// ----------------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return YES;
}

// ----------------------------------------------------------------------------------
// 在 iOS8 系统中，还需要添加这个方法。通过新的 API 注册推送服务
// ----------------------------------------------------------------------------------
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
}

// ----------------------------------------------------------------------------------
// 当 DeviceToken 获取失败时，系统会回调此方法
// ----------------------------------------------------------------------------------
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    
}


@end
