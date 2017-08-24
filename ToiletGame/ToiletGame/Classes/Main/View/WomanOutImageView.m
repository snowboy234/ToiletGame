//
//  WomanOutImageView.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "WomanOutImageView.h"

@implementation WomanOutImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"woman_out1"];
    }
    return self;
}
@end
