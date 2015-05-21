//
//  RMStarScore.m
//  RMStarScore
//
//  Created by chd on 15/5/21.
//  Copyright (c) 2015年 chd. All rights reserved.
//

#import "RMStarScore.h"
#import "UIView+CustomFrame.h"
#import "NSString+Size.h"
#import "StarView.h"
#import "RMDefines.h"

@implementation RMStarScore

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)data{
    if (self = [super initWithFrame:frame]) {
        [self scoreView:data];
    }
    return self;
}

/**
 *  评分
 */
- (void)scoreView:(NSArray *)data {
    
    NSArray *colorArr = @[kColor(107, 197, 108),kColor(164, 203, 108),kColor(187, 214, 77),kColor(251, 160, 40),kColor(250, 90, 32)];
    
    //获取数据
    float totalPerson = 0;   //总评论人数
    float starCount = 0;     //总星数
    for (int i = 0; i < data.count; i++) {
        totalPerson += [data[i] intValue];
        starCount += [data[i] intValue] * (5 - i);
    }
    
    UIView *leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 0, self.width, 200);
    //分数
    UILabel *scoreLabel = [[UILabel alloc] init];
    scoreLabel.text = [NSString stringWithFormat:@"%.1f",starCount / totalPerson];
    CGSize size = [NSString sizeWithText:scoreLabel.text font:[UIFont systemFontOfSize:40]];
    scoreLabel.font = [UIFont systemFontOfSize:40];
    scoreLabel.x = kBorder * 3;
    scoreLabel.y = kBorder * 2;
    scoreLabel.size = size;
    [leftView addSubview:scoreLabel];
    //总评分结果星星
    StarView *star = [[StarView alloc] init];
    star.width = 90;
    star.height = 20;
    star.centerX = scoreLabel.centerX;
    star.y = CGRectGetMaxY(scoreLabel.frame) ;
    star.fillColor = kColor(255, 198, 0);
    star.frontColor = kColor(255, 255, 255);
    star.backColor = kColor(216, 216, 216);
    star.level = [scoreLabel.text floatValue];  //     总的评论星数 / 总的评论人数
    [leftView addSubview:star];
    
    //总评论人数
    UILabel *comLabel = [[UILabel alloc] init];
    comLabel.text = [NSString stringWithFormat:@"共%.0f人点评",totalPerson];
    comLabel.size = [NSString sizeWithText:comLabel.text font:[UIFont systemFontOfSize:12]];
    comLabel.centerX = star.centerX;
    comLabel.y = CGRectGetMaxY(star.frame) + kBorder * 0.5;
    comLabel.font = [UIFont systemFontOfSize:12];
    [leftView addSubview:comLabel];
    leftView.height = CGRectGetMaxY(comLabel.frame) + kBorder * 2;
    
    UIView *rightView = [[UIView alloc] init];
    rightView.x = CGRectGetMaxX(scoreLabel.frame) + kBorder * 3;
    rightView.y = scoreLabel.y;
    rightView.width = self.width - rightView.x - kBorder * 2;
    rightView.height = 0;
    
    //添加每颗星 评分细节
    CGFloat commentPerCountLabel = 0; //每个评级的评论人数长度
    for (int i = 0; i < 5; i++) {
        //星级按钮
        UIButton *starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        starBtn.frame = CGRectMake(0, kBorder * i, 40, 15);
        starBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [starBtn setTitle:[NSString stringWithFormat:@"%d", 5 - i] forState:UIControlStateNormal];
        starBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        starBtn.userInteractionEnabled = NO;
        [starBtn setTitleColor:kColor(79, 79, 79) forState:UIControlStateNormal];
        [starBtn setImage:[UIImage imageNamed:@"b27_icon_star_yellow"] forState:UIControlStateNormal];
        starBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 25);
        starBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [rightView addSubview:starBtn];
        
        commentPerCountLabel = CGRectGetMaxX(rightView.bounds) - CGRectGetMaxX(starBtn.bounds);  //计算评论条的最大长度
        CGFloat scale = [data[i] floatValue] / totalPerson;       //计算当前评论占总评论的比例
        CGFloat minW = 0;                                         //评论条最短长度
        
        if (![data[i] intValue]) {
            minW = 0;
        } else {
            if (commentPerCountLabel * scale < 20) {
                CGSize minS = [NSString sizeWithText:[data[i] description] font:[UIFont systemFontOfSize:14]];
                minW = minS.width + 4;
            } else {
                minW = commentPerCountLabel * scale + 4;                  //总长度 * 当前所占比例 = 获取当前长度
            }
        }
        
        //进度条
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(CGRectGetMaxX(starBtn.frame), 0, minW, 18);
        //        if ([_delegate respondsToSelector:@selector(scoreBackWidth:label:)]) {
        //            [_delegate scoreBackWidth:minW label:label];
        //        }
        label.centerY = starBtn.centerY;
        label.backgroundColor = colorArr[i];
        label.text = [NSString stringWithFormat:@" %@",[data[i] description]];
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
        [rightView addSubview:label];
        rightView.height = CGRectGetMaxY(starBtn.frame);
    }
    
    [self addSubview:leftView];
    [self addSubview:rightView];
}


@end
