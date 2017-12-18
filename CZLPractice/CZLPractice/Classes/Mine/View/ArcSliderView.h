//
//  ArcSliderView.h
//  QiQiRobot
//
//  Created by yuzeux on 2017/12/15.
//  Copyright © 2017年 Qunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Math.h"

@class Sector;


@interface ArcSliderView : UIControl

@property (nonatomic, strong) Sector *sector;//扇形区域
@property (nonatomic, readwrite) double sectorsRadius;//扇形半径
@property (nonatomic, readwrite) double startAngle;//开始的角度
@property (nonatomic, readwrite) double endAngle;//结束的角度
@property (nonatomic, assign) double markRadius;//标记半径
@property (nonatomic, copy) void (^drowNumber)(CGFloat radius,CGFloat x,CGFloat y);//如果需要在圆弧上面写上字，需要给该block赋值，其中，radius为圆弧直径，x,y中心点
@property (nonatomic, assign) double circleLineWidth;//圆弧宽度
@property (nonatomic, assign) double lineWidth;//线宽
@property (nonatomic,   copy) void (^numBlock)(NSString * num);

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;


@end



@interface Sector : NSObject

@property (strong, nonatomic) UIColor *color;

@property (nonatomic, readwrite) double minValue;//最小
@property (nonatomic, readwrite) double maxValue;//最大

@property (nonatomic, readwrite) double startValue;//开始值
@property (nonatomic, readwrite) double endValue;//结束值

@property (nonatomic, readwrite) NSInteger tag;//标记

- (instancetype) init;

+ (instancetype) sector;
+ (instancetype) sectorWithColor:(UIColor *)color;
+ (instancetype) sectorWithColor:(UIColor *)color maxValue:(double)maxValue;
+ (instancetype) sectorWithColor:(UIColor *)color minValue:(double)minValue maxValue:(double)maxValue;

@end
