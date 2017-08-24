//
//  LoseImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "LoseImageView.h"

@implementation LoseImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * loseBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loseBg"]];
        [loseBg sizeToFit];
        loseBg.center = self.center;
        [self addSubview:loseBg];
        
        UIImageView * lose = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lose"]];
        [lose sizeToFit];
        lose.center = self.center;
        [self addSubview:lose];
    }
    return self;
}

@end
