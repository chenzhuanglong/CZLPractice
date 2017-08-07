//
//  UIColor+CZLCategory.h
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CZLCategory)
/**
 随机颜色
 
 @return 随机颜色
 */
+ (UIColor *)randomColor;

+ (UIColor *)colorWithHex:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHex:(NSString *)color alpha:(CGFloat)alpha;

@end
