//
//  WomanToukanImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "WomanToukanImageView.h"

@implementation WomanToukanImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.animationImages = @[[UIImage imageNamed:@"woman_toukan1"],
                                 [UIImage imageNamed:@"woman_toukan2"],
                                 [UIImage imageNamed:@"woman_toukan3"]
                                 ];
        self.animationDuration = 0.5;
        [self startAnimating];
    }
    return self;
}

@end
