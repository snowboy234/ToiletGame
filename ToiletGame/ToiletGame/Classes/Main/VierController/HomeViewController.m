//
//  HomeViewController.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/21.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "HomeViewController.h"
#import "GameViewController.h"
#import "HomeToGameAnimation.h"

@interface HomeViewController ()<HomeToGameAnimationDelegate>
@property (nonatomic, strong) GameViewController * gameVc;
@property (nonatomic, strong) HomeToGameAnimation * animationTool;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _gameVc = [[GameViewController alloc]init];
    _animationTool = [[HomeToGameAnimation alloc]init];
    [self setupBgView];
    [self setupTitleLabel];
    [self setupStartButton];
}

- (void)setupStartButton{
    UIButton * start = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat proportion = 357 / 130.0;
    CGFloat width = TWScreenWidth / 2.0;
    CGFloat height = width / proportion;
    CGFloat x = (TWScreenWidth - width) * 0.5;
    start.frame = CGRectMake(x, TWScreenHeight -height - 100, width, height);
    [start setTitle:@"START" forState:UIControlStateNormal];
    start.titleLabel.font = TWTextFont1(40);
    [start setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
}

- (void)startButtonClick{
    _gameVc.transitioningDelegate = _animationTool;
    _animationTool.delegate = self;
    [self presentViewController:_gameVc animated:YES completion:nil];
}

- (void)setupBgView{
    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    bgImageView.image = [UIImage imageNamed:@"homebg"];
    [self.view addSubview:bgImageView];
}

- (void)setupTitleLabel{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, TWScreenWidth, 200)];
    label.text = @"Toilet! Go!";
    label.font = TWTextFont1(80);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = TWColorRGB(220, 120, 116);
    [self.view addSubview:label];
}

- (UIImageView *)getRightScreenImage{
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [self getImage];
    return imageView;
}

-(UIImage *)getImage{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
