//
//  CZLGraphics.m
//  CZLPractice
//
//  Created by yuzeux on 2017/12/25.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLGraphics.h"

@implementation CZLGraphics


- (instancetype)init {
    if (self = [super init]) {

        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // --------------------------实心圆
    // 2.画图
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 50, 50));
    [[UIColor greenColor] set];
    // 3.渲染
    CGContextFillPath(ctx);
    
    // --------------------------空心圆
    CGContextAddEllipseInRect(ctx, CGRectMake(70, 10, 50, 50));
    [[UIColor redColor] setFill];
    CGContextStrokePath(ctx);
    
    
    // --------------------------椭圆
    //画椭圆和画圆方法一样，椭圆只是设置不同的长宽
    CGContextAddEllipseInRect(ctx, CGRectMake(130, 10, 100, 50));
    [[UIColor purpleColor] set];
    CGContextFillPath(ctx);
    
    // --------------------------直线
    CGContextMoveToPoint(ctx, 20, 80); // 起点
    CGContextAddLineToPoint(ctx, self.frame.size.width-10, 80); //终点
    //    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 1.0); // 颜色
    [[UIColor redColor] set]; // 两种设置颜色的方式都可以
    CGContextSetLineWidth(ctx, 2.0f); // 线的宽度
    CGContextSetLineCap(ctx, kCGLineCapRound); // 起点和重点圆角
    CGContextSetLineJoin(ctx, kCGLineJoinRound); // 转角圆角
    CGContextStrokePath(ctx); // 渲染（直线只能绘制空心的，不能调用CGContextFillPath(ctx);）
    
    // --------------------------三角形
    CGContextMoveToPoint(ctx, 10, 150); // 第一个点
    CGContextAddLineToPoint(ctx, 60, 100); // 第二个点
    CGContextAddLineToPoint(ctx, 100, 150); // 第三个点
    [[UIColor purpleColor] set];
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    
    
    // --------------------------矩形
    CGContextAddRect(ctx, CGRectMake(20, 170, 100, 50));
    [[UIColor orangeColor] set];
    //    CGContextStrokePath(ctx); // 空心
    CGContextFillPath(ctx);
    
    
    
    // --------------------------圆弧
    CGContextAddArc(ctx, 200, 170, 50, M_PI, M_PI_4, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    
    // --------------------------文字
    NSString *str = @"你在红楼，我在西游";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor]; // 文字颜色
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14]; // 字体
    
    [str drawInRect:CGRectMake(20, 250, 300, 30) withAttributes:dict];
    
    
    // --------------------------图片
    UIImage *img = [UIImage imageNamed:@"yingmu"];
    //    [img drawAsPatternInRect:CGRectMake(20, 280, 300, 300)]; // 多个平铺
    //    [img drawAtPoint:CGPointMake(20, 280)]; // 绘制到指定点，图片有多大就显示多大
    [img drawInRect:CGRectMake(20, 280, 80, 80)]; // 拉伸
    
    
    // 1. 创建贝瑟尔路径
//    UIBezierPath *path = [UIBezierPath bezierPath];
//
//    // 2. 设置起点
//    [path moveToPoint:CGPointMake(20, 20)];
//
//    // 3. 设置终点
//    [path addLineToPoint:CGPointMake(80, 150)];
//
//    // 4. 设置路径状态
//    // 设置颜色
//    [[UIColor redColor] set];
//    // 设置线宽
//    [path setLineWidth:5];
//
//    // 4. 绘制路径
//    [path stroke];
    
    
    
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 50, 100)];
    
    // 矩阵操作
    // 移动
    CGContextTranslateCTM(context, 100, 100);
    // 缩放
    CGContextScaleCTM(context, 1, 2);
    // 旋转
    CGContextRotateCTM(context, M_PI_4);
    
    
    // 把路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    
    // 设置颜色
    [[UIColor blueColor] set];
    
    // 渲染上下文
    CGContextStrokePath(context);
    
    
   
}


@end
