//
//  ManImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "ManImageView.h"

@implementation ManImageView

- (NSString *)sex{
    return @"Man";
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.animationImages = @[[UIImage imageNamed:@"man_niaoji1"],[UIImage imageNamed:@"man_niaoji2"]];
        self.animationDuration = 0.25;
        [self startAnimating];
    }
    return self;
}

@end
