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
#import "AboutViewController.h"
#import "HomeToAboutAnimation.h"
#import "TWStrokeLabel.h"

@interface HomeViewController ()<HomeToGameAnimationDelegate, HomeToAboutAnimationDelegate>
@property (nonatomic, strong) HomeToGameAnimation * animationTool;
@property (nonatomic, strong) HomeToAboutAnimation * animationLeftTool;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animationTool = [HomeToGameAnimation shareHomeToGameAnimation];
    _animationLeftTool = [HomeToAboutAnimation shareHomeToAboutAnimation];
    [self setupBgView];
    [self setupTitleLabel];
    [self setupStartButton];
    [self setupAboutButton];
}

- (void)setupStartButton{
    UIButton * start = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat proportion = 357 / 130.0;
    CGFloat width = TWScreenWidth / 2.0;
    CGFloat height = width / proportion;
    CGFloat x = (TWScreenWidth - width) * 0.5;
    start.frame = CGRectMake(x, TWScreenHeight -height - 120, width, height);
    [start setTitle:@"START" forState:UIControlStateNormal];
    start.titleLabel.font = TWTextFont1(40);
    [start setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
}

- (void)setupAboutButton{
    UIButton * about = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat proportion = 357 / 130.0;
    CGFloat width = TWScreenWidth / 2.0;
    CGFloat height = width / proportion;
    CGFloat x = (TWScreenWidth - width) * 0.5;
    about.frame = CGRectMake(x, TWScreenHeight -height - 30, width, height);
    [about setTitle:@"ABOUT" forState:UIControlStateNormal];
    about.titleLabel.font = TWTextFont1(40);
    [about setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
    [about addTarget:self action:@selector(aboutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:about];
}

- (void)aboutButtonClick{
    AboutViewController * aboutVc = [[AboutViewController alloc]init];
    aboutVc.transitioningDelegate = _animationLeftTool;
    _animationLeftTool.delegate = self;
    [self presentViewController:aboutVc animated:YES completion:nil];
}

- (void)startButtonClick{
    GameViewController * gameVc = [[GameViewController alloc]init];
    gameVc.transitioningDelegate = _animationTool;
    _animationTool.delegate = self;
    [self presentViewController:gameVc animated:YES completion:nil];
}

- (void)setupBgView{
    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    bgImageView.image = [UIImage imageNamed:@"homebg"];
    [self.view addSubview:bgImageView];
}

- (void)setupTitleLabel{
    TWStrokeLabel * label = [[TWStrokeLabel alloc]initWithFrame:CGRectMake(0, 50, TWScreenWidth, 200)];
    label.text = @"Toilet! Go!";
    label.font = TWTextFont1(80);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = TWColorRGB(220, 120, 116);
    [self.view addSubview:label];
}


- (UIImageView *)getLeftScreenImage{
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [self getImage];
    return imageView;
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
