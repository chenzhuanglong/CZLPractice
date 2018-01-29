//
//  CZLBaseViewController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLBaseViewController.h"

@interface CZLBaseViewController ()<UINavigationBarDelegate>

@end

@implementation CZLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectZero];
    navigationBar.backgroundColor = [UIColor blueColor];
    navigationBar.barTintColor = [UIColor yellowColor];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    navigationBar.delegate = self;
    navigationBar.items = @[[UINavigationItem new]];
    navigationBar.topItem.title = self.title;
    [self.view addSubview:navigationBar];
    

    navigationBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (@available(iOS 11.0, *)) {
//        self.additionalSafeAreaInsets = UIEdgeInsetsMake(44, 0, 0, 0);
        
        NSLayoutConstraint *left = [navigationBar.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor];
        NSLayoutConstraint *right = [navigationBar.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor];
        NSLayoutConstraint *top = [navigationBar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor];
        NSLayoutConstraint *height = [navigationBar.heightAnchor constraintEqualToConstant:44];
        [NSLayoutConstraint activateConstraints:@[left, right, top, height]];
    }else{
        NSLayoutConstraint *left = [navigationBar.leftAnchor constraintEqualToAnchor:self.view.leftAnchor];
        NSLayoutConstraint *right = [navigationBar.rightAnchor constraintEqualToAnchor:self.view.rightAnchor];
        NSLayoutConstraint *top = [navigationBar.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor];
        NSLayoutConstraint *height = [navigationBar.heightAnchor constraintEqualToConstant:44];
        [NSLayoutConstraint activateConstraints:@[left, right, top, height]];
    }

}

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}


@end
