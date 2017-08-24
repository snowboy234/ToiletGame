//
//  GameViewController.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/21.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "GameViewController.h"
#import "ManImageView.h"
#import "WomanImageView.h"

@interface GameViewController ()



@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBgView];
    
}

- (void)setupBgView{
    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    bgImageView.image = [UIImage imageNamed:@"gamebg"];
    [self.view addSubview:bgImageView];
}




@end
