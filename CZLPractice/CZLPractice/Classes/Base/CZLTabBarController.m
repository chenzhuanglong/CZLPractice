//
//  CZLTabBarController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLTabBarController.h"
#import "CZLNavigationController.h"

#import "CZLMineViewController.h"
#import "CZLPractice-Swift.h"


@interface CZLTabBarController ()

@end

@implementation CZLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation];
}

- (void)initNavigation {
    
    CZLNavigationController *homeNavigationController = [[CZLNavigationController alloc]initWithRootViewController:[CZLSwiftViewController new]];
    [homeNavigationController setTabBarImage:@"" selectedImage:@"" title:@"SWIFT"];
    
    CZLNavigationController *mineNavigationController = [[CZLNavigationController alloc]initWithRootViewController:[CZLMineViewController new]];
    [mineNavigationController setTabBarImage:@"" selectedImage:@"" title:@"我的"];
    
    
    self.viewControllers = @[homeNavigationController,mineNavigationController];
    
    [CZLNavigationController setTabBarItemNormalColor:[UIColor blueColor] andSelectedColor:[UIColor greenColor] fontSize:15.0f];
}



@end
