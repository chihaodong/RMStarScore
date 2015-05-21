//
//  StarView.h
//  ScoreDemo
//
//  Created by 彭显鹤 on 15/5/16.
//  Copyright (c) 2015年 彭显鹤. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface StarView : UIView

@property (strong, nonatomic) IBInspectable UIColor * frontColor;
@property (strong, nonatomic) IBInspectable UIColor * fillColor;
@property (strong, nonatomic) IBInspectable UIColor * backColor;
@property (assign, nonatomic) IBInspectable CGFloat level;

@end
