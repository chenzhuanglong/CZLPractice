//
//  PrizeEggsView.m
//  Legoland
//
//  Created by yuzeux on 2018/3/9.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import "PrizeEggsView.h"

@interface PrizeEggsView()<CAAnimationDelegate>

@property (nonatomic, strong)UIImageView *brokenEggsImageView;

@property (nonatomic, strong)UIButton *prizeButton;

@end

@implementation PrizeEggsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    CGSize brokenSize = CGSizeMake(ture6_H(239),  ture6_H(277.5));
    CGPoint point =  CGPointMake(self.center.x - brokenSize.width / 2 - ture6_H(6), (self.center.y  - brokenSize.height) / 2 - ture6_H(32));
    
    CGRect prizeRect = CGRectMake(self.centerX - ture6_H(120) / 2, CGRectGetMaxY(self.bounds) / 2  - ture6_H(73), ture6_H(120), ture6_H(73));
    
    self.brokenEggsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(point.x, point.y, brokenSize.width, brokenSize.height)];
    self.brokenEggsImageView.image = [UIImage imageNamed:@"eggs_broken"];
    //    self.brokenEggsImageView.hidden = YES;
    [self addSubview:self.brokenEggsImageView];
    
    self.prizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.prizeButton.frame = prizeRect;
    [self addSubview:self.prizeButton];
    
    CGPoint endPoint = CGPointMake(self.centerX, 0);
    [self prizeAnimationFromPoint:endPoint withFarPoint:self.prizeButton.center view:self.prizeButton];
}

- (void)prizeWithPrizeType:(PrizeType)prizeType withNum:(NSString *)num {
    
    switch (prizeType) {
        case PrizeTypeGolden:
            [self.prizeButton setImage:[UIImage imageNamed:@"eggs_golden"] forState:UIControlStateNormal];
            break;
        case PrizeTypeRed:
            [self.prizeButton setImage:[UIImage imageNamed:@"eggs_red"] forState:UIControlStateNormal];
            break;
        case PrizeTypeBlue:
            [self.prizeButton setImage:[UIImage imageNamed:@"eggs_blue"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
    [self.prizeButton setTitle:[NSString stringWithFormat:@"X%@",num] forState:UIControlStateNormal];
    
}

- (void)prizeAnimationFromPoint:(CGPoint)endPoint withFarPoint:(CGPoint)farPoint view:(UIView *)view {
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:farPoint];
    anima.toValue = [NSValue valueWithCGPoint:endPoint];
    anima.duration = 1.0f;
    anima.delegate = self;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    
    [view.layer addAnimation:anima forKey:@"prizeAnimation"];
    
}


//动画结束回调
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    
    if([self.prizeButton.layer animationForKey:@"prizeAnimation"] == theAnimation){
        
        if (self.endAnimationBlock){
            self.endAnimationBlock();
        }
    }
    
}


@end
