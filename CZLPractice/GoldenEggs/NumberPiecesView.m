//
//  NumberPiecesView.m
//  Legoland
//
//  Created by yuzeux on 2018/3/9.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import "NumberPiecesView.h"

@interface NumberPiecesView()<CAAnimationDelegate>

@property (nonatomic,strong)UIButton *oneButton;
@property (nonatomic,strong)UIButton *twoButton;
@property (nonatomic,strong)UIButton *threeButton;

@property (nonatomic,strong)UILabel *haveLabel;
@property (nonatomic,strong)UIButton *oneOldButton;
@property (nonatomic,strong)UIButton *twoOldButton;
@property (nonatomic,strong)UIButton *threeOldButton;
@property (nonatomic,strong)UIImageView *tickImageView;

@property (nonatomic, strong)TensileButton *determineButton;
@property (nonatomic, strong)UILabel *promptLabel;

@end

@implementation NumberPiecesView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        [self initUI];
    }
    return self;
}


- (void)initUI {
    
    CGRect oneRect =  CGRectMake(ture6_H(40), 0, ture6_H(120), ture6_H(73));
    
    CGRect twoRect =  CGRectMake(CGRectGetMidX(self.frame) - ture6_H(100) / 2, 0, ture6_H(120), ture6_H(73));
    
    CGRect threeRect =  CGRectMake(CGRectGetMaxX(self.frame) - ture6_H(140) , 0, ture6_H(120), ture6_H(73));
    
    
    CGRect determineRect = CGRectMake(CGRectGetMidX(self.frame) - ture6_H(77) / 2, self.height - ture6_H(100) , ture6_H(77), ture6_H(78));
    
    CGRect oneOldRect =  CGRectMake(ture6_H(40),ture6_H(178), ture6_H(120), ture6_H(73));
    
    CGRect twoOldRect =  CGRectMake(CGRectGetMidX(self.frame) - ture6_H(100) / 2, ture6_H(178), ture6_H(120), ture6_H(73));
    
    CGRect threeOldRect =  CGRectMake(CGRectGetMaxX(self.frame) - ture6_H(140) , ture6_H(178), ture6_H(120), ture6_H(73));

    self.oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.oneButton setImage:[UIImage imageNamed:@"eggs_golden"] forState:UIControlStateNormal];
    self.oneButton.frame = oneRect;
    [self addSubview:self.oneButton];
    
    self.twoButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.twoButton setImage:[UIImage imageNamed:@"eggs_red"] forState:UIControlStateNormal];
    self.twoButton.frame = twoRect;
    [self addSubview:self.twoButton];
    
    self.threeButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.threeButton setImage:[UIImage imageNamed:@"eggs_blue"] forState:UIControlStateNormal];
    self.threeButton.frame = threeRect;
    [self addSubview:self.threeButton];
    
    self.haveLabel = [[UILabel alloc]initWithFrame:CGRectMake(turn6(40), ture6_H(137), ScreenWidth - turn6(80), ture6_H(18))];
    self.haveLabel.text = @"当前拥有";
    self.haveLabel.textColor = [UIColor whiteColor];
    self.haveLabel.font = [UIFont boldSystemFontOfSize:ture6_H(18)];
    self.haveLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.haveLabel];
    
    self.oneOldButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.oneOldButton setImage:[UIImage imageNamed:@"eggs_golden"] forState:UIControlStateNormal];
    [self.oneOldButton setTitle:[UserInformation shareInstance].goldenDebris forState:UIControlStateNormal];
    self.oneOldButton.frame = oneOldRect;
    [self addSubview:self.oneOldButton];
    
    self.twoOldButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.twoOldButton setImage:[UIImage imageNamed:@"eggs_red"] forState:UIControlStateNormal];
    [self.twoOldButton setTitle:[UserInformation shareInstance].redDebris forState:UIControlStateNormal];
    self.twoOldButton.frame = twoOldRect;
    [self addSubview:self.twoOldButton];
    
    self.threeOldButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.threeOldButton setImage:[UIImage imageNamed:@"eggs_blue"] forState:UIControlStateNormal];
    [self.threeOldButton setTitle:[UserInformation shareInstance].blueDebris forState:UIControlStateNormal];
    self.threeOldButton.frame = threeOldRect;
    [self addSubview:self.threeOldButton];
    
    self.determineButton =  [TensileButton buttonWithType:UIButtonTypeCustom];
    [self.determineButton setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
    [self.determineButton addTarget:self action:@selector(determineClick:) forControlEvents:UIControlEventTouchUpInside];
    self.determineButton.frame = determineRect;
    [self addSubview:self.determineButton];
    
    self.promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height - ture6_H(11), ScreenWidth, ture6_H(11))];
    self.promptLabel.text = @"所得礼物可在“礼品专区”查看";
    self.promptLabel.textColor = [UIColor whiteColor];
    self.promptLabel.font = [UIFont boldSystemFontOfSize:ture6_H(11)];
    self.promptLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.promptLabel];
    
    self.tickImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"eggs_tick"]];
    [self addSubview:self.tickImageView];
}

- (void)addNumberGolden:(NSString *)golden andRed:(NSString *)red andBlue:(NSString *)blue {
    [self.oneButton setTitle:[NSString stringWithFormat:@"X%@",golden] forState:UIControlStateNormal];
    [self.twoButton setTitle:[NSString stringWithFormat:@"X%@",red] forState:UIControlStateNormal];
    [self.threeButton setTitle:[NSString stringWithFormat:@"X%@",blue] forState:UIControlStateNormal];
}

- (void)addWinType:(NSInteger)type whitNum:(NSString *)num {
    
    switch (type) {
        case 3:
            [self goldenNum:num];
            break;
        case 1:
            [self redNum:num];
            break;
        case 2:
            [self blueNum:num];
            break;
        default:
            break;
    }

}

- (void)goldenNum:(NSString *)num {
    NSString *numTick = [NSString stringWithFormat:@"%ld",[[UserInformation shareInstance].goldenDebris integerValue] + [num integerValue]];
    self.tickImageView.frame = CGRectMake(self.oneButton.center.x - ture6_H(51) / 2, self.oneButton.center.y - ture6_H(41) / 2 , ture6_H(51), ture6_H(41));
    [self.oneOldButton setTitle:numTick forState:UIControlStateNormal];
     [UserInformation shareInstance].goldenDebris = numTick;
}


- (void)redNum:(NSString *)num {
    NSString *numTick = [NSString stringWithFormat:@"%ld",[[UserInformation shareInstance].redDebris integerValue] + [num integerValue]];
    self.tickImageView.frame = CGRectMake(self.twoButton.center.x - ture6_H(51) / 2, self.twoButton.center.y - ture6_H(41) / 2, ture6_H(51), ture6_H(41));
    [self.twoOldButton setTitle:numTick forState:UIControlStateNormal];
    [UserInformation shareInstance].redDebris = numTick;
}


- (void)blueNum:(NSString *)num {
    NSString *numTick = [NSString stringWithFormat:@"%ld",[[UserInformation shareInstance].blueDebris integerValue] + [num integerValue]];
    self.tickImageView.frame = CGRectMake(self.threeButton.center.x - ture6_H(51) / 2, self.threeButton.center.y - ture6_H(41) / 2, ture6_H(51), ture6_H(41));
    [self.threeOldButton setTitle:numTick forState:UIControlStateNormal];
    [UserInformation shareInstance].blueDebris = numTick;
}


- (void)determineClick:(TensileButton *)sender {
    if(self.determineBlock){
        self.determineBlock();
    }
}


@end
