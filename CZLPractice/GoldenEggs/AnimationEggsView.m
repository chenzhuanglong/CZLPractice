//
//  AnimationEggsView.m
//  Legoland
//
//  Created by yuzeux on 2018/3/6.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import "AnimationEggsView.h"


@interface AnimationEggsView()<CAAnimationDelegate>

@property (nonatomic,strong)UIButton *oneButton;
@property (nonatomic,strong)UIButton *twoButton;
@property (nonatomic,strong)UIButton *threeButton;

@property (nonatomic,strong)UIImageView *eggAnimation;


@end

@implementation AnimationEggsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
        
    }
    return self;
}

- (void)initUI {

    CGRect eggRect =  CGRectMake(CGRectGetMidX(self.frame) - ture6_H(174) / 2 , self.height - ture6_H(219), ture6_H(150),  ture6_H(189));
    
    CGRect oneRect =  CGRectMake(ture6_H(40), 0, ture6_H(120), ture6_H(73));
    
    CGRect twoRect =  CGRectMake(CGRectGetMidX(self.frame) - ture6_H(100) / 2, 0, ture6_H(120), ture6_H(73));
    
    CGRect threeRect =  CGRectMake(CGRectGetMaxX(self.frame) - ture6_H(140) , 0, ture6_H(120), ture6_H(73));
    
    self.eggAnimation = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"goldenEggs"]];
    self.eggAnimation.frame = eggRect;
    [self addSubview:self.eggAnimation];

    self.oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.oneButton.titleLabel setFont:[UIFont boldSystemFontOfSize:ture6_H(17)]];
    [self.oneButton setImage:[UIImage imageNamed:@"eggs_golden"] forState:UIControlStateNormal];
    self.oneButton.frame = oneRect;
    [self addSubview:self.oneButton];
    
    self.twoButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.twoButton.titleLabel setFont:[UIFont boldSystemFontOfSize:ture6_H(17)]];
    [self.twoButton setImage:[UIImage imageNamed:@"eggs_red"] forState:UIControlStateNormal];
    self.twoButton.frame = twoRect;
    [self addSubview:self.twoButton];
    
    self.threeButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    self.threeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.threeButton setImageEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    [self.threeButton.titleLabel setFont:[UIFont boldSystemFontOfSize:ture6_H(17)]];
    [self.threeButton setImage:[UIImage imageNamed:@"eggs_blue"] forState:UIControlStateNormal];
    self.threeButton.frame = threeRect;
    [self addSubview:self.threeButton];
}


- (void)animationWillStart {
    [self foldAnimationFromPoint:self.oneButton.center withFarPoint:self.eggAnimation.center view:self.oneButton];
}


//位移动画
-(void)positionAnimationView:(UIView *)view toValue:(CGPoint )point{
    //使用CABasicAnimation创建基础动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:point];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMaxX(self.frame) / 2, view.frame.origin.y)];
    anima.duration = 0.8f;
    
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    anima.fillMode = kCAFillModeForwards;
    anima.delegate = self;
    anima.removedOnCompletion = NO;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [view.layer addAnimation:anima forKey:@"positionAnimation"];
    
}

/**
 *  抖动效果
 */
-(void)shakeAnimationView:(UIView *)view {
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*3];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*3];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*3];
    frameAnimation.values = @[value1,value2,value3];
    frameAnimation.repeatCount = 3;

    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[frameAnimation];
    animations.duration = 0.35;
    animations.delegate = self;
    
    [view.layer addAnimation:animations forKey:@"shakeAnimation"];
}



- (void)foldAnimationFromPoint:(CGPoint)endPoint withFarPoint:(CGPoint)farPoint
                          view:(UIView *)view {
    
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.values = @[@(0), @(M_PI * 2)];
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotationAnimation.duration = 0.4f;
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 0.4f;
    scaleAnimation.repeatCount = 1;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.values = @[@(1),@(0.6)];

    
    CAKeyframeAnimation *movingAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    // Create moving path
    //
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, endPoint.x, endPoint.y);
    CGPathAddLineToPoint(path, NULL, farPoint.x, farPoint.y);
    
    movingAnimation.keyTimes = @[@(0.0f), @(1.0)];
    
    movingAnimation.path = path;
    movingAnimation.duration = 0.4f;
    CGPathRelease(path);
    
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[rotationAnimation,scaleAnimation,movingAnimation];
    animations.duration = 0.4f;
    animations.delegate = self;
    animations.fillMode = kCAFillModeForwards;
    animations.removedOnCompletion = NO;
    
    [view.layer addAnimation:animations forKey:@"foldAnimation"];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    
    if([self.oneButton.layer animationForKey:@"foldAnimation"] == theAnimation) {
        [self foldAnimationFromPoint:self.twoButton.center withFarPoint:self.eggAnimation.center view:self.twoButton];
        [self.oneButton setHidden:YES];
    }else if ([self.twoButton.layer animationForKey:@"foldAnimation"] == theAnimation){
         [self foldAnimationFromPoint:self.threeButton.center withFarPoint:self.eggAnimation.center view:self.threeButton];
         [self.twoButton setHidden:YES];
    }else if ([self.threeButton.layer animationForKey:@"foldAnimation"] == theAnimation){
         [self.threeButton setHidden:YES];
        [self positionAnimationView:self.eggAnimation toValue:CGPointMake(CGRectGetMaxX(self.frame) / 2,CGRectGetMaxY(self.eggAnimation.frame) / 2 + 30)];
    }else if ([self.eggAnimation.layer animationForKey:@"positionAnimation"] == theAnimation){
        [self shakeAnimationView:self.eggAnimation];
    }else {
        self.hidden = YES;
        if (self.endAnimationBlock){
            self.endAnimationBlock();
        }
    }
 
}

- (void)addNumberGolden:(NSString *)golden andRed:(NSString *)red andBlue:(NSString *)blue {
    [self.oneButton setTitle:[NSString stringWithFormat:@"X%@",golden] forState:UIControlStateNormal];
    [self.twoButton setTitle:[NSString stringWithFormat:@"X%@",red] forState:UIControlStateNormal];
    [self.threeButton setTitle:[NSString stringWithFormat:@"X%@",blue] forState:UIControlStateNormal];
}





@end
