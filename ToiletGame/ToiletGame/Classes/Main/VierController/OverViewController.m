//
//  OverViewController.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "OverViewController.h"
#import "WinImageView.h"
#import "LoseImageView.h"

@interface OverViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
- (IBAction)restartButtonClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxScroeLabel;
@property (nonatomic, strong) WinImageView * win;
@property (nonatomic, strong) LoseImageView * lose;
@property (nonatomic, strong) UIImageView * wuya;
@end

@implementation OverViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _scoreLabel.text = [NSString stringWithFormat:@"%ld",_score];
    [self refreshUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.35];
    _middleView.layer.cornerRadius = 10;
    _middleView.layer.masksToBounds = YES;
    _scoreLabel.font = TWTextFont(80);
    _scoreLabel.textColor = [UIColor colorWithRed:1.000f green:0.682f blue:0.000f alpha:1.00f];
}

- (void)refreshUI{
    // 获取最大数据
    NSInteger max = [[NSUserDefaults standardUserDefaults] integerForKey:InCount];
    _maxScroeLabel.text = [NSString stringWithFormat:@"Top Score ：%ld",max];
    
    if (max >= _score) {
        _lose = [[LoseImageView alloc]initWithFrame:CGRectMake(0, 0, TWScreenWidth, TWScreenWidth)];
        _wuya = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wuya"]];
        CGSize size = [UIImage imageNamed:@"wuya"].size;
        _wuya.frame = CGRectMake(TWScreenWidth - size.width, (TWScreenHeight - size.height) * 0.5, size.width, size.height);
        [_middleView addSubview:_lose];
        [self.view addSubview:_wuya];
        
        [UIView animateWithDuration:2.5 delay:0 options:UIViewAnimationOptionRepeat animations:^{
            _wuya.tw_x = 0;
        } completion:^(BOOL finished) {}];
    } else {
        _win = [[WinImageView alloc]initWithFrame:CGRectMake(0, 0, TWScreenWidth, TWScreenWidth)];
        [_middleView addSubview:_win];
        [[NSUserDefaults standardUserDefaults] setInteger:_score forKey:InCount];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
}

- (void)setScore:(NSInteger)score{
    _score = score;
    _scoreLabel.text = [NSString stringWithFormat:@"%ld",score];
}

- (IBAction)restartButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:^{
        if (_block) {
            _block();
        }
    }];
}
@end
