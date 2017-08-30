//
//  CZLCustomModel.h
//  CZLPractice
//
//  Created by yuzeux on 2017/8/12.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZLCustomModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

+ (instancetype)modelWithName:(NSString *)name icon:(NSString *)icon;
- (instancetype)initWithName:(NSString *)name icon:(NSString *)icon;

@end
