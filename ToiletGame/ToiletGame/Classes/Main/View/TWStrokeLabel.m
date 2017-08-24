//
//  TWStrokeLabel.m
//  EatFruit
//
//  Created by 田伟 on 2017/8/12.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWStrokeLabel.h"

@implementation TWStrokeLabel

- (void)drawTextInRect:(CGRect)rect{
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    // 设置描边的宽度
    CGContextSetLineWidth(c, 5);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    // 设置描边的颜色
    self.textColor = [UIColor whiteColor];
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    
    self.shadowOffset = shadowOffset;
}

@end
