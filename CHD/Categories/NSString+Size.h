//
//  UILabel+Size.h
//  根据文字获取对应Size大小
//
//  Created by chd on 15/5/18.
//  Copyright (c) 2015年 CHD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Size)
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font;
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth;
@end
