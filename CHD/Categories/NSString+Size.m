//
//  UILabel+Size.m
//  根据文字获取对应Size大小
//
//  Created by chd on 15/5/18.
//  Copyright (c) 2015年 CHD. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)



+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font {
    return [self sizeWithText:text font:font maxWidth:MAXFLOAT];
}

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    CGSize size = CGSizeMake(maxWidth, MAXFLOAT);
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

@end
