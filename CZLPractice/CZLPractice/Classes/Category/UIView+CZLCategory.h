//
//  UIView+CZLCategory.h
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CZLCategory)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat left;
@property (assign, nonatomic) CGFloat right;
@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat bottom;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

- (void)disableAWhile;
- (void)disableAWhile:(NSTimeInterval)time;

- (UIViewController *)viewController;
- (UINavigationController *)navigationController;


@end
