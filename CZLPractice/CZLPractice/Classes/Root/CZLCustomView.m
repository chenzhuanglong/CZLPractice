//
//  CZLCustomView.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/12.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLCustomView.h"
#import "CZLCustomModel.h"

@interface CZLCustomView()

@property (nonatomic, weak) UIImageView *iconImageView;

@property (nonatomic, weak) UILabel *nameLabel;

@end

@implementation CZLCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        UIImageView *iconImageView = [UIImageView new];
        self.iconImageView = iconImageView;
        [self addSubview:iconImageView];
        
        UILabel *nameLabel = [UILabel new];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont systemFontOfSize: 10];
        nameLabel.textColor = [UIColor redColor];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor orangeColor];
    CGFloat iconImageViewX = 0;
    CGFloat iconImageViewY = 0;
    CGFloat iconImageViewW = self.bounds.size.width;
    CGFloat iconImageViewH = 80;
    self.iconImageView.frame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
    
    CGFloat nameLabelX = 0;
    CGFloat nameLabelY = iconImageViewH;
    CGFloat nameLabelW = iconImageViewW;
    CGFloat nameLabelH = self.bounds.size.height - iconImageViewH;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
}

- (void)setModel:(CZLCustomModel *)model
{
    _model = model;
    
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;

}

@end
