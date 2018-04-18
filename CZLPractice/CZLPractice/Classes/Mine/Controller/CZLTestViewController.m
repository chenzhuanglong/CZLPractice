//
//  CZLTestViewController.m
//  CZLPractice
//
//  Created by yuzeux on 2017/12/25.
//  Copyright © 2017年 DerenChen. All rights reserved.
//

#import "CZLTestViewController.h"
#import "CZLGraphics.h"



@interface CZLTestViewController ()<UITextFieldDelegate>


@property (nonatomic, strong) UITextField *textField;


@end

@implementation CZLTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
    contentView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:contentView];
    
    
    contentView.translatesAutoresizingMaskIntoConstraints = NO;//使用autolayout
    if (@available(iOS 11.0, *)) {
        NSLayoutConstraint *top = [contentView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor];
        NSLayoutConstraint *bottom = [contentView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor];
        NSLayoutConstraint *left = [contentView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor];
        NSLayoutConstraint *right = [contentView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor];
        [NSLayoutConstraint activateConstraints:@[left, right, top, bottom]];
    } else {
        NSLayoutConstraint *top = [contentView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor];
        NSLayoutConstraint *bottom = [contentView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor];
        NSLayoutConstraint *left = [contentView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor];
        NSLayoutConstraint *right = [contentView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor];
        [NSLayoutConstraint activateConstraints:@[top, bottom, left, right]];
    }
//

    
}



@end
