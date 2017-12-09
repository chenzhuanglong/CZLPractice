//
//  CZLNavigationController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/7.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLNavigationController.h"

@interface CZLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation CZLNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addGestureRecognizer];
    
}

/**
 Navigation 添加属性
 
 @param image 显示的图片
 @param selectedImage 点击完的图片
 @param title 主题
 */
- (void)setTabBarImage:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    self.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.title = title;
    

    
//    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
//    gradientLayer.colors = @[(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
//    gradientLayer.startPoint = CGPointMake(0, 1);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.navigationController.view.frame), CGRectGetHeight(self.navigationController.view.frame));
//    [self.tabBarItem.view.layer addSublayer:gradientLayer];

}

/**
 tabBarItem 字体颜色大小
 
 @param color 颜色
 @param selectedColor 点击颜色
 @param size 字体大小
 */
+ (void)setTabBarItemNormalColor:(UIColor *)color andSelectedColor:(UIColor *)selectedColor fontSize:(CGFloat)size {
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, [UIFont systemFontOfSize:size],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:selectedColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:size],NSFontAttributeName,nil] forState:UIControlStateSelected];
    // 标题向上偏移2.
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, 0)];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 侧滑手势

- (void)addGestureRecognizer {
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView *gestureView = gesture.view;
    
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
    popRecognizer.delegate = self;
    popRecognizer.maximumNumberOfTouches = 1;
    [gestureView addGestureRecognizer:popRecognizer];
    
    //获取系统手势的target数组
    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
    //获取它的唯一对象，我们知道它是一个叫UIGestureRecognizerTarget的私有类，它有一个属性叫_target
    id gestureRecognizerTarget = [_targets firstObject];
    //获取_target:_UINavigationInteractiveTransition，它有一个方法叫handleNavigationTransition:
    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
    //通过前面的打印，我们从控制台获取出来它的方法签名。
    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
    //创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer
    [popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint touchLocation = [touch locationInView:touch.view];
    
    CGFloat absX = fabs(touchLocation.x);
    CGFloat absY = fabs(touchLocation.y);
    
    // 设置滑动有效距离
    if (MAX(absX, absY) < 10)
        return NO;
    
    if (absX > absY ) {
        
        if (touchLocation.x<0) {
            
            //向左滑动
            return YES;
        }else{
            //向右滑动
            return NO;
        }
        
    } else if (absY > absX) {
        if (touchLocation.y<0) {
            
            //向上滑动
            return YES;
        }else{
            
            //向下滑动
            return YES;
        }
    }
    
    return  YES;
}




@end
