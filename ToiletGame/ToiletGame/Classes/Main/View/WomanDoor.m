//
//  WomanDoor.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "WomanDoor.h"

@implementation WomanDoor

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.animationImages = @[[UIImage imageNamed:@"woman_door1"],
                                 [UIImage imageNamed:@"woman_door2"],
                                 [UIImage imageNamed:@"woman_door3"],
                                 [UIImage imageNamed:@"woman_door4"],
                                 [UIImage imageNamed:@"woman_door5"]
                                 ];
        self.animationDuration = 0.5;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.animationImages = @[[UIImage imageNamed:@"woman_door1"],
                                 [UIImage imageNamed:@"woman_door2"],
                                 [UIImage imageNamed:@"woman_door3"],
                                 [UIImage imageNamed:@"woman_door4"],
                                 [UIImage imageNamed:@"woman_door5"]
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
