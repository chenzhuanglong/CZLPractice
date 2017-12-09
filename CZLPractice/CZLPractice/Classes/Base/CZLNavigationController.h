//
//  CZLNavigationController.h
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZLNavigationController : UINavigationController
/**
 Navigation 添加属性
 
 @param image 显示的图片
 @param selectedImage 点击完的图片
 @param title 主题
 */
- (void)setTabBarImage:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title;

/**
 tabBarItem 字体颜色大小
 
 @param color 颜色
 @param selectedColor 点击颜色
 @param size 字体大小
 */
+ (void)setTabBarItemNormalColor:(UIColor *)color andSelectedColor:(UIColor *)selectedColor fontSize:(CGFloat)size;


@end
