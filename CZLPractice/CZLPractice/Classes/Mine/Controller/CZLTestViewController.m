//
//  CZLTestViewController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/12/25.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLTestViewController.h"
#import "CZLGraphics.h"

@interface CZLTestViewController ()

@end

@implementation CZLTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CZLGraphics *view = [[CZLGraphics alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
}




@end
