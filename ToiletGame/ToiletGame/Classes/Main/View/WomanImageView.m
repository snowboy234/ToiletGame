//
//  WomanImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "WomanImageView.h"

@implementation WomanImageView

- (NSString *)sex{
    return @"Woman";
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.animationImages = @[[UIImage imageNamed:@"woman_niaoji1"],
                                 [UIImage imageNamed:@"woman_niaoji2"]
                                 ];
        self.animationDuration = 0.25;
        [self startAnimating];
    }
    return self;
}

@end
