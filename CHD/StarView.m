//
//  StarView.m
//  ScoreDemo
//
//  Created by 彭显鹤 on 15/5/16.
//  Copyright (c) 2015年 彭显鹤. All rights reserved.
//

#import "StarView.h"
#import "ScoreKit.h"

@implementation StarView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [ScoreKit drawScoreViewWithFrame:rect frontColor:self.frontColor fillColor:self.fillColor backColor:self.backColor scoreLevel:self.level / 5];
}

- (void)setLevel:(CGFloat)level {
    if (level > 5.0) {
        level = 5.0;
    }
    if (level < 0) {
        level = 0;
    }
    _level = level;
    [self setNeedsDisplay];
}
@end
