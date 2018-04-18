//
//  selectGoldenEggsView.h
//  Legoland
//
//  Created by yuzeux on 2018/3/8.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectGoldenEggsView : UIView

@property (nonatomic, strong)void (^endAnimationBlock)();

@property (nonatomic, strong)void (^selectGoldenEggsBlock)(void);

@end
