//
//  NumberPiecesView.h
//  Legoland
//
//  Created by yuzeux on 2018/3/9.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPiecesView : UIView

- (void)addNumberGolden:(NSString *)golden andRed:(NSString *)red andBlue:(NSString *)blue;
- (void)addWinType:(NSInteger)type whitNum:(NSString *)num;
@property (nonatomic, strong)void (^determineBlock)(void);


@end
