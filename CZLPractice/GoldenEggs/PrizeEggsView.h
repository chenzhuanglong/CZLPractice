//
//  PrizeEggsView.h
//  Legoland
//
//  Created by yuzeux on 2018/3/9.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, PrizeType){
    PrizeTypeGolden         =  3,
    PrizeTypeRed            =  1,
    PrizeTypeBlue           =  2,
};

@interface PrizeEggsView : UIView

- (void)prizeWithPrizeType:(PrizeType)prizeType withNum:(NSString *)num;

@property (nonatomic, strong)void (^endAnimationBlock)(void);

@end
