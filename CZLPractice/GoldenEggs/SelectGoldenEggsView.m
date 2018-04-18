//
//  selectGoldenEggsView.m
//  Legoland
//
//  Created by yuzeux on 2018/3/8.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import "SelectGoldenEggsView.h"


@interface SelectGoldenEggsView()<CAAnimationDelegate>

@property (nonatomic, strong)TensileButton *oneEggButton;
@property (nonatomic, strong)UIImageView *oneImageView;
@property (nonatomic, strong)TensileButton *twoEggButton;
@property (nonatomic, strong)UIImageView *twoImageView;
@property (nonatomic, strong)TensileButton *threeEggButton;
@property (nonatomic, strong)UIImageView *threeImageView;
@property (nonatomic, strong)TensileButton *determineButton;

@property (nonatomic, strong)UILabel *promptLabel;
@property (nonatomic, strong)UIImageView *hammerImageView;

@property (nonatomic, assign)NSInteger numberEgg;
@end

@implementation SelectGoldenEggsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.numberEgg = 0;
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    CGRect oneRect =  CGRectMake(ture6_H(20), 0, ture6_H(103), ture6_H(130));
    CGRect twoRect =  CGRectMake(CGRectGetMidX(self.frame) - ture6_H(103) / 2, 0, ture6_H(103), ture6_H(130));
    CGRect threeRect =  CGRectMake(ScreenWidth - ture6_H(20) - ture6_H(103), 0, ture6_H(103), ture6_H(130));
    CGRect determineRect = CGRectMake(CGRectGetMidX(self.frame) - ture6_H(77) / 2, self.height - ture6_H(100) , ture6_H(77), ture6_H(78));
    
    self.oneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-ture6_H(28), -ture6_H(40), ture6_H(203), ture6_H(210))];
    self.oneImageView.hidden = YES;
    self.oneImageView.image = [UIImage imageNamed:@"light"];
    [self addSubview:self.oneImageView];
    
    self.oneEggButton =  [TensileButton buttonWithType:UIButtonTypeCustom];
    self.oneEggButton.tag = 1;
    self.oneEggButton.selected = NO;
    [self.oneEggButton setImage:[UIImage imageNamed:@"unGoldenEggs"] forState:UIControlStateNormal];
    [self.oneEggButton setImage:[UIImage imageNamed:@"goldenEggs"] forState:UIControlStateSelected];
    [self.oneEggButton addTarget:self action:@selector(shakeAnimation:) forControlEvents:UIControlEventTouchUpInside];
    self.oneEggButton.frame = oneRect;
    [self addSubview:self.oneEggButton];
    
    self.twoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - ture6_H(203) / 2, -ture6_H(40), ture6_H(203), ture6_H(210))];
    self.twoImageView.hidden = YES;
    self.twoImageView.image = [UIImage imageNamed:@"light"];
    [self addSubview:self.twoImageView];
    
    self.twoEggButton =  [TensileButton buttonWithType:UIButtonTypeCustom];
    self.twoEggButton.tag = 2;
    self.twoEggButton.selected = NO;
    [self.twoEggButton setImage:[UIImage imageNamed:@"unGoldenEggs"] forState:UIControlStateNormal];
    [self.twoEggButton setImage:[UIImage imageNamed:@"goldenEggs"] forState:UIControlStateSelected];
    [self.twoEggButton addTarget:self action:@selector(shakeAnimation:) forControlEvents:UIControlEventTouchUpInside];
    self.twoEggButton.frame = twoRect;
    [self addSubview:self.twoEggButton];
    
    self.threeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth + ture6_H(28) - ture6_H(203),-ture6_H(40), ture6_H(203), ture6_H(210))];
    self.threeImageView.hidden = YES;
    self.threeImageView.image = [UIImage imageNamed:@"light"];
    [self addSubview:self.threeImageView];
    
    self.threeEggButton =  [TensileButton buttonWithType:UIButtonTypeCustom];
    self.threeEggButton.tag = 3;
    self.threeEggButton.selected = NO;
    [self.threeEggButton setImage:[UIImage imageNamed:@"unGoldenEggs"] forState:UIControlStateNormal];
    [self.threeEggButton setImage:[UIImage imageNamed:@"goldenEggs"] forState:UIControlStateSelected];
    [self.threeEggButton addTarget:self action:@selector(shakeAnimation:) forControlEvents:UIControlEventTouchUpInside];
    self.threeEggButton.frame = threeRect;
    [self addSubview:self.threeEggButton];
    
    self.determineButton =  [TensileButton buttonWithType:UIButtonTypeCustom];
    [self.determineButton setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
    [self.determineButton addTarget:self action:@selector(determineClick:) forControlEvents:UIControlEventTouchUpInside];
    self.determineButton.frame = determineRect;
    [self addSubview:self.determineButton];
    
    self.promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height - ture6_H(12), ScreenWidth, ture6_H(12))];
    self.promptLabel.text = @"提示：选择金蛋后点击开启砸蛋";
    self.promptLabel.textColor = [UIColor whiteColor];
    self.promptLabel.font = [UIFont boldSystemFontOfSize:ture6_H(12)];
    self.promptLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.promptLabel];
    
    self.hammerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - ture6_H(108), 0, ture6_H(100), ture6_H(80))];
    self.hammerImageView.image = [UIImage imageNamed:@"eggs_hammer"];
    self.hammerImageView.hidden = YES;
    [self addSubview:self.hammerImageView];
    
    
    
}

- (void)shakeAnimation:(TensileButton *)sender {
    [self shakeAnimationView:sender];
    self.numberEgg = sender.tag;
    switch (sender.tag) {
        case 1:
            self.oneEggButton.selected = YES;
            self.twoEggButton.selected = NO;
            self.threeEggButton.selected = NO;
            self.oneImageView.hidden = NO;
            self.twoImageView.hidden = YES;
            self.threeImageView.hidden = YES;
            break;
        case 2:
            self.oneEggButton.selected = NO;
            self.twoEggButton.selected = YES;
            self.threeEggButton.selected = NO;
            self.oneImageView.hidden = YES;
            self.twoImageView.hidden = NO;
            self.threeImageView.hidden = YES;
            break;
        case 3:
            self.oneEggButton.selected = NO;
            self.twoEggButton.selected = NO;
            self.threeEggButton.selected = YES;
            self.oneImageView.hidden = YES;
            self.twoImageView.hidden = YES;
            self.threeImageView.hidden = NO;
            break;
        default:
            break;
    }
 
    
}

- (void)determineClick:(TensileButton *)sender {
    
    
    if (self.numberEgg == 0) {
        return;
    }
    
    if (self.selectGoldenEggsBlock){
        self.selectGoldenEggsBlock();
    }
    
    
    [self fadeAnimationView:sender];
    [self fadeAnimationView:self.promptLabel];
    
    TensileButton *button;
    
    if (self.numberEgg == 1){
         button = self.oneEggButton;
         [self fadeAnimationView:self.twoEggButton];
         [self fadeAnimationView:self.threeEggButton];
    }else if(self.numberEgg == 2){
         button = self.twoEggButton;
         [self fadeAnimationView:self.oneEggButton];
         [self fadeAnimationView:self.threeEggButton];
    }else if (self.numberEgg == 3){
         button = self.threeEggButton;
         [self fadeAnimationView:self.oneEggButton];
         [self fadeAnimationView:self.twoEggButton];
    }
    
    self.oneImageView.hidden = YES;
    self.twoImageView.hidden = YES;
    self.threeImageView.hidden = YES;
    
    CGPoint point = CGPointMake(self.center.x, self.center.y / 2);
    [self combinationAnimationFromPoint:point withFarPoint:button.center view:button];
}

- (void)fadeAnimationView:(UIView *)view{
    view.hidden = YES;
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [view.layer addAnimation:anima forKey:@"fadeAnimation"];
}

/**
 *  抖动效果
 */
-(void)shakeAnimationView:(UIView *)view{

    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    frameAnimation.values = @[value1,value2,value3];
    frameAnimation.repeatCount = 3;
    
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[frameAnimation];
    animations.duration = 0.35;
    animations.delegate = self;
    
    [view.layer addAnimation:animations forKey:@"shakeAnimation"];
}


- (void)combinationAnimationFromPoint:(CGPoint)endPoint withFarPoint:(CGPoint)farPoint view:(UIView *)view {
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:farPoint];
    anima.toValue = [NSValue valueWithCGPoint:endPoint];
    anima.duration = 1.0f;
    
//    放大
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 1;
    scaleAnimation.repeatCount = 1;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.values = @[@(1),@(1.6)];
    
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[anima,scaleAnimation];
    animations.duration = 1;
    animations.delegate = self;
    animations.fillMode = kCAFillModeForwards;
    animations.removedOnCompletion = NO;
    
    [view.layer addAnimation:animations forKey:@"combinationAnimation"];
    
}




- (void)hammerAnimationView:(UIView *)view {
    
    CAKeyframeAnimation *rotationAnima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnima.values = @[[NSNumber numberWithFloat:-M_PI_4],[NSNumber numberWithFloat:M_PI_4],[NSNumber numberWithFloat:-M_PI_4]];
    rotationAnima.duration = 0.5f;
    rotationAnima.delegate = self;
    rotationAnima.repeatCount = 1;
    rotationAnima.fillMode = kCAFillModeForwards;
    rotationAnima.removedOnCompletion = NO;
    
    [view.layer addAnimation:rotationAnima forKey:@"hammerAnimation"];
    
}

- (void)hammerAnimationFromPoint:(CGPoint)endPoint withFarPoint:(CGPoint)farPoint view:(UIView *)view {
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:farPoint];
    anima.toValue = [NSValue valueWithCGPoint:endPoint];
    anima.duration = 0.5f;
    anima.delegate = self;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    
    [view.layer addAnimation:anima forKey:@"hammerPositionAnimation"];
    
}

/**
 *  抖动效果
 */
-(void)shakeEggAnimationView:(UIView *)view{
    
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    frameAnimation.values = @[value1,value2,value3];
    frameAnimation.repeatCount = 2;
    frameAnimation.duration = 0.35;
    frameAnimation.delegate = self;
    frameAnimation.fillMode = kCAFillModeForwards;
    frameAnimation.removedOnCompletion = NO;
    
    [view.layer addAnimation:frameAnimation forKey:@"shakeEggAnimation"];
}



//动画结束回调
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    TensileButton *button;
    if (self.numberEgg == 1){
        button = self.oneEggButton;
    }else if(self.numberEgg == 2){
        button = self.twoEggButton;
    }else if (self.numberEgg == 3){
        button = self.threeEggButton;
    }
    
    if([button.layer animationForKey:@"combinationAnimation"] == theAnimation) {
        self.hammerImageView.hidden = NO;
        CGPoint point =  CGPointMake(self.center.x + ture6_H(40), self.center.y / 2 - ture6_H(50));
        [self hammerAnimationFromPoint:point withFarPoint:self.hammerImageView.center view:self.hammerImageView];
    }else if([self.hammerImageView.layer animationForKey:@"hammerPositionAnimation"] == theAnimation) {
        [self hammerAnimationView:self.hammerImageView];
    }else if([self.hammerImageView.layer animationForKey:@"hammerAnimation"] == theAnimation){
        [self shakeEggAnimationView:button];
    }else if([button.layer animationForKey:@"shakeEggAnimation"] == theAnimation){
  
        if (self.endAnimationBlock){
            self.endAnimationBlock();
        }
    }

}

@end
