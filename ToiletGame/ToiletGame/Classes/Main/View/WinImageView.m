//
//  WinImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "WinImageView.h"

@implementation WinImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * sun = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sun"]];
        [sun sizeToFit];
        sun.center = self.center;
        [self addSubview:sun];
        
        UIImageView * win = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"win"]];
        [win sizeToFit];
        win.center = self.center;
        [self addSubview:win];
    }
    return self;
}

@end
