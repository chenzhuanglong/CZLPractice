//
//  AnimationEggsView.h
//  Legoland
//
//  Created by yuzeux on 2018/3/6.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationEggsView : UIView

- (void)addNumberGolden:(NSString *)golden andRed:(NSString *)red andBlue:(NSString *)blue;

- (void)animationWillStart;
@property (nonatomic, strong)void (^endAnimationBlock)(void);

@end
