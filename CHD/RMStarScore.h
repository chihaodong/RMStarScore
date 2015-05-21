//
//  RMStarScore.h
//  RMStarScore
//
//  Created by chd on 15/5/21.
//  Copyright (c) 2015年 chd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMStarScoreDelegate <NSObject>

@optional
//动画代理
- (void)scoreBackWidth:(CGFloat)width label:(UILabel *)label;

@end

@interface RMStarScore : UIView

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)data;
@property(nonatomic, weak) id<RMStarScoreDelegate> delegate;

@end
