//
//  GoldenEggsView.m
//  Legoland
//
//  Created by yuzeux on 2018/3/6.
//  Copyright © 2018年 QunYu. All rights reserved.
//

#import "GoldenEggsView.h"
#import "AnimationEggsView.h"
#import "SelectGoldenEggsView.h"
#import "PrizeEggsView.h"
#import "NumberPiecesView.h"
#import "PrizeModel.h"

@interface GoldenEggsView()

@property (nonatomic, strong)AnimationEggsView *animationEggsView;
@property (nonatomic, strong)SelectGoldenEggsView *selectGoldenEggsView;
@property (nonatomic, strong)PrizeEggsView *prizeEggsView;
@property (nonatomic, strong)NumberPiecesView *numberPiecesView;
@property (nonatomic, strong)UserConfigurationInformation *userConfigurationInformation;
@property (nonatomic, strong)UILabel *titleLabel;
@property (strong, nonatomic)UIImageView *backImageView;
@property (nonatomic, strong)NSMutableArray *data;

@property (nonatomic, assign)NSInteger colorType;
@property (nonatomic, strong)NSString *winNum;


@property (nonatomic, strong)NSString *model;
@property (nonatomic, strong)NSString *levels;

@property (nonatomic, strong)NSString *goldenNum;
@property (nonatomic, strong)NSString *redNum;
@property (nonatomic, strong)NSString *blueNum;

@end

@implementation GoldenEggsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        
        [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.and.top.bottom.mas_offset(0);
        }];
        
        UIView *backView = [[UIView alloc]init];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.7;
        backView.frame = self.bounds;
        [self addSubview:backView];
        
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, ture6_H(127), ScreenWidth, ture6_H(30))];
        self.titleLabel.text = @"幸运砸金蛋";
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:ture6_H(30)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        self.animationEggsView = [[AnimationEggsView alloc]initWithFrame:CGRectMake(0, ViewBottom(self.titleLabel) + ture6_H(30), ScreenWidth, ture6_H(354))];
        
        WEAKSELF;
        self.animationEggsView.endAnimationBlock = ^{
            [weakSelf rippleAnimation];
        };
        [self addSubview:self.animationEggsView];
        
        UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self.animationEggsView addGestureRecognizer:tapGesturRecognizer];
        
    }
    return self;
}


- (UIImageView *)backImageView {
    if (!_backImageView){
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"checkpoint_choice_background_image"]];
        [self addSubview:imageView];
        _backImageView = imageView;
    }
    return _backImageView;
}

- (UserConfigurationInformation *)userConfigurationInformation {
    if (!_userConfigurationInformation){
        _userConfigurationInformation = [UserConfigurationInformation new];
    }
    return _userConfigurationInformation;
}

- (NSMutableArray *)data {
    if (!_data){
        NSMutableArray *data = [NSMutableArray array];
        _data = data;
    }
    return _data;
}

- (void)rippleAnimation{
    WEAKSELF;
    self.selectGoldenEggsView = [[SelectGoldenEggsView alloc]initWithFrame:CGRectMake(0, ViewBottom(self.titleLabel) + ture6_H(30), ScreenWidth, ture6_H(354))];
    self.selectGoldenEggsView.endAnimationBlock = ^{
        [weakSelf prizeEggsAnimation];
    };
    self.selectGoldenEggsView.selectGoldenEggsBlock = ^{
        [weakSelf goldenEggsViewNum:weakSelf.winNum andPrize:[NSString stringWithFormat:@"%ld",(long)weakSelf.colorType]];
    };
    [self addSubview:self.selectGoldenEggsView];
    
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self.animationEggsView.layer addAnimation:anima forKey:@"fadeAnimation"];
}

- (void)prizeEggsAnimation{
    WEAKSELF;
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self.selectGoldenEggsView.layer addAnimation:anima forKey:@"fadeAnimation"];
    self.selectGoldenEggsView.hidden = YES;
    
    self.prizeEggsView = [[PrizeEggsView alloc]initWithFrame:CGRectMake(0, ViewBottom(self.titleLabel) + ture6_H(30), ScreenWidth, ture6_H(354))];
    self.prizeEggsView.endAnimationBlock = ^{
        [weakSelf numberPiecesAnimation];
    };
    [self.prizeEggsView prizeWithPrizeType:self.colorType withNum:[NSString stringWithFormat:@"%@",self.winNum]];
    [self addSubview:self.prizeEggsView];
}

- (void)numberPiecesAnimation{
    WEAKSELF;
    
    self.prizeEggsView.hidden = YES;
    
    self.numberPiecesView = [[NumberPiecesView alloc]initWithFrame:CGRectMake(0, ViewBottom(self.titleLabel) + ture6_H(30), ScreenWidth, ture6_H(354))];
    self.numberPiecesView.determineBlock = ^{
        [weakSelf removeFromSuperview];
    };
    [self.numberPiecesView addNumberGolden:self.goldenNum andRed:self.redNum andBlue:self.blueNum];
    [self.numberPiecesView addWinType:self.colorType whitNum:self.winNum];
    [self addSubview:self.numberPiecesView];
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    self.animationEggsView.userInteractionEnabled = NO;
    [self.animationEggsView animationWillStart];
}



- (void)goldenEggsViewModel:(NSString *)model andLevels:(NSString *)levels recordId:(NSString *)recordId {
    self.model = model;
    self.levels = levels;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [UserInformation getUserId],    @"uid",
                         model,                          @"model",
                         levels,                         @"levels",
                         recordId,                       @"id",
                         nil];
    
    NSString *url = [PPNetworkHelper requestURL:@"Api/Game/levelsItem?"];
    [PPNetworkHelper POST:url parameters:dic encrypt:YES responseCache:^(PPResponse *responseCache) {
    } success:^(PPResponse *responseObject) {
        
        if (responseObject.success){
            NSDictionary *dic = responseObject.result;
            NSDictionary *prizeDataDic = [dic valueForKey:@"prizeData"];
 
            for (NSDictionary *dics in prizeDataDic) {
                PrizeModel *model = [[PrizeModel alloc]initWithDictionary:dics];
                if ([model.typePrize isEqualToString:@"red"]){
                    if ([model.win isEqualToString:@"1"]){
                        self.winNum = model.numberPieces;
                        self.colorType = 1;
                    }
                    self.redNum = model.numberPieces;
                }else if ([model.typePrize isEqualToString:@"golden"]){
                    if ([model.win isEqualToString:@"1"]){
                        self.winNum = model.numberPieces;
                        self.colorType = 3;
                    }
                    self.goldenNum = model.numberPieces;
                }else if ([model.typePrize isEqualToString:@"blue"]){
                    if ([model.win isEqualToString:@"1"]){
                        self.winNum = model.numberPieces;
                        self.colorType = 2;
                    }
                    self.blueNum = model.numberPieces;
                }
                [self.data addObject:model];
            }
            
            [UserInformation shareInstance].redDebris = [[dic valueForKey:@"userPrize"] valueForKey:@"red_debris"];
            [UserInformation shareInstance].blueDebris = [[dic valueForKey:@"userPrize"] valueForKey:@"blue_debris"];
            [UserInformation shareInstance].goldenDebris = [[dic valueForKey:@"userPrize"] valueForKey:@"golden_beans"];
        }
        [self.animationEggsView addNumberGolden:self.goldenNum andRed:self.redNum andBlue:self.blueNum];
    } failure:^(NSError *error) {
    }];
}

- (void)goldenEggsViewNum:(NSString *)num andPrize:(NSString *)prize{
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [UserInformation getUserId],    @"uid",
                         num,                          @"num",
                         prize,                         @"prize",
                         nil];
    
    NSString *url = [PPNetworkHelper requestURL:@"Api/Game/results?"];
    [PPNetworkHelper POST:url parameters:dic encrypt:YES responseCache:^(PPResponse *responseCache) {
    } success:^(PPResponse *responseObject) {
        if (responseObject.success){
            [self.userConfigurationInformation checkpointChoice:[self.model integerValue] andIndex:[self.levels integerValue] - 1 andIsGoldenEggs:NO];
        }
    } failure:^(NSError *error) {
    }];
}


@end
