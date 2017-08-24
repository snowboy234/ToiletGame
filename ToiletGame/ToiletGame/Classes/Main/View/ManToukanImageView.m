//
//  ManToukanImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "ManToukanImageView.h"

@implementation ManToukanImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.animationImages = @[[UIImage imageNamed:@"man_toukan1"],
                                 [UIImage imageNamed:@"man_toukan2"]
                                 ];
        self.animationDuration = 0.35;
        [self startAnimating];
    }
    return self;
}

@end
