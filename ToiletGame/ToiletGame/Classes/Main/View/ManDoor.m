//
//  ManDoor.m
//  Text
//
//  Created by 田伟 on 2017/8/23.
//  Copyright © 2017年 个人. All rights reserved.
//

#import "ManDoor.h"

@implementation ManDoor

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.animationImages = @[[UIImage imageNamed:@"man_door1"],
                                 [UIImage imageNamed:@"man_door2"],
                                 [UIImage imageNamed:@"man_door3"],
                                 [UIImage imageNamed:@"man_door4"],
                                 [UIImage imageNamed:@"man_door5"]
                                 ];
        self.animationDuration = 0.5;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.animationImages = @[[UIImage imageNamed:@"man_door1"],
                                 [UIImage imageNamed:@"man_door2"],
                                 [UIImage imageNamed:@"man_door3"],
                                 [UIImage imageNamed:@"man_door4"],
                                 [UIImage imageNamed:@"man_door5"]
                                 ];
        self.animationDuration = 0.5;
    }
    return self;
}

- (void)beginAnimation{
    [self startAnimating];
}

- (void)endAnimation{
     [self endAnimation];
}

@end
