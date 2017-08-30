//
//  CZLCustomModel.m
//  CZLPractice
//
//  Created by yuzeux on 2017/8/12.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLCustomModel.h"

@implementation CZLCustomModel

+ (instancetype)modelWithName:(NSString *)name icon:(NSString *)icon
{
    return [[self alloc]initWithName:name icon:icon];
}
- (instancetype)initWithName:(NSString *)name icon:(NSString *)icon
{
    
    if (self = [super init]) {
        self.name = name;
        self.icon = icon;
    }
    return self;
}

@end
