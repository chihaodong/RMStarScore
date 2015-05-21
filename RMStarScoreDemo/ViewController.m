//
//  ViewController.m
//  RMStarScoreDemo
//
//  Created by kiwi on 15/5/21.
//  Copyright (c) 2015年 chd. All rights reserved.
//

#import "ViewController.h"
#import "RMStarScore.h"
#import "UIView+CustomFrame.h"

@interface ViewController ()<RMStarScoreDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)viewDidAppear:(BOOL)animated {
    RMStarScore *star = [[RMStarScore alloc] initWithFrame:self.view.bounds data:@[@92,@73,@29,@63,@10]];
    star.delegate = self;
    [self.view addSubview:star];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scoreBackWidth:(CGFloat)width label:(UILabel *)label{
    [UIView animateWithDuration:1.0 animations:^{
        label.width = width;
    } completion:nil];
}

@end
