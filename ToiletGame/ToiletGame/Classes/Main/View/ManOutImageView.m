//
//  ManOutImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "ManOutImageView.h"

@implementation ManOutImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"man_out1"];
//        self.animationImages = @[[UIImage imageNamed:@"man_out1"],
//                                 [UIImage imageNamed:@"man_out2"]
//                                 ];
//        self.animationDuration = 0.2;
//        self.animationRepeatCount = 1;
//        [self startAnimating];
    }
    return self;
}

@end
