//
//  GameViewController.m
//  ToiletGame
//
//  Created by 田伟 on 2017/8/24.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "GameViewController.h"
#import "ManImageView.h"
#import "WomanImageView.h"
#import "ManDoor.h"
#import "WomanDoor.h"
#import "ManOutImageView.h"
#import "WomanOutImageView.h"
#import "TWStrokeLabel.h"
#import "ManToukanImageView.h"
#import "WomanToukanImageView.h"
#import "OverViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet TWStrokeLabel *scoreLabel;
- (IBAction)leftTapClick:(UIButton *)sender;
- (IBAction)rightTapClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *niaojiRoadView;
@property (weak, nonatomic) IBOutlet WomanDoor *womanDoorImageView;
@property (weak, nonatomic) IBOutlet ManDoor *manDoorImageView;

@property (nonatomic, strong) NSMutableArray <PersonView *> * niaojiArray;
@property (nonatomic, strong) ManImageView * man1;
@property (nonatomic, strong) ManImageView * man2;
@property (nonatomic, strong) ManImageView * man3;
@property (nonatomic, strong) ManImageView * man4;
@property (nonatomic, strong) WomanImageView * woman1;
@property (nonatomic, strong) WomanImageView * woman2;
@property (nonatomic, strong) WomanImageView * woman3;
@property (nonatomic, strong) WomanImageView * woman4;
@property (nonatomic, strong) NSMutableDictionary * showDic;
@property (nonatomic, strong) ManOutImageView * manOut;
@property (nonatomic, strong) WomanOutImageView * womanOut;
@property (nonatomic, assign) NSInteger inCount;
@property (nonatomic, strong) ManToukanImageView * manToukan;
@property (nonatomic, strong) WomanToukanImageView * womanToukan;
//@property (nonatomic, strong) OverViewController * overVc;
@property (nonatomic, strong) UIView * cover;
@property (weak, nonatomic) IBOutlet UIImageView *progressBarImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressBarYCons;


@end

@implementation GameViewController

#define ManWidth TWScreenWidth * 0.34
#define ManHeight 266.0 * ManWidth / 180.0
#define FourthY TWScreenHeight - 140 - ManHeight
#define MoveTime 1.0

- (NSMutableArray<PersonView *> *)niaojiArray{
    if (_niaojiArray == nil) {
        _niaojiArray = [NSMutableArray arrayWithObjects:_man1, _man2, _man3, _man4, _woman1, _woman2, _woman3, _woman4, nil];
        for (NSInteger i = 0; i < _niaojiArray.count; i++) {
            _niaojiArray[i].numid = i;
        }
    }
    return _niaojiArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObject];
    [self setupPerson];
    [self chooesFourPerson];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.progressBarYCons.constant = TWScreenWidth;
    [UIView animateWithDuration:5 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)initObject{
    _inCount = 0;
    _scoreLabel.text = [NSString stringWithFormat:@"%ld",_inCount];
    _scoreLabel.font = TWTextFont1(50);
    _scoreLabel.textColor = [UIColor colorWithRed:0.957f green:0.690f blue:0.243f alpha:1.00f];
    CGFloat manOutWeight = _womanDoorImageView.tw_width;
    CGFloat manOutHeight = _womanDoorImageView.tw_width * 127 / 143.0;
    _manOut = [[ManOutImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_womanDoorImageView.frame), CGRectGetMaxY(_womanDoorImageView.frame) - manOutHeight, manOutWeight, manOutHeight)];
    
    CGFloat womanOutWeight = _manDoorImageView.tw_width;
    CGFloat womanOutHeight = _manDoorImageView.tw_width * 141 / 137.0;
    _womanOut = [[WomanOutImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_manDoorImageView.frame) - womanOutWeight, CGRectGetMaxY(_manDoorImageView.frame) - womanOutHeight, womanOutWeight, womanOutHeight)];
    
    CGFloat manToukanWeight = TWScreenWidth * 0.75;
    CGFloat manToukanHeight = 409.0 * manToukanWeight / 261.0;
    CGFloat manToukanX = (TWScreenWidth - manToukanWeight) * 0.5;
    CGFloat manToukanY = TWScreenHeight * (1 - 0.17) - manToukanHeight;
    _manToukan = [[ManToukanImageView alloc]initWithFrame:CGRectMake(manToukanX, manToukanY, manToukanWeight, manToukanHeight)];
    CGFloat womanToukanWeight = TWScreenWidth * 0.75;
    CGFloat womanToukanHeight = 398.0 * womanToukanWeight / 244.0;
    CGFloat womanToukanX = (TWScreenWidth - womanToukanWeight) * 0.5;
    CGFloat womanToukanY = TWScreenHeight * (1 - 0.17) - womanToukanHeight;
    _womanToukan = [[WomanToukanImageView alloc]initWithFrame:CGRectMake(womanToukanX, womanToukanY, womanToukanWeight, womanToukanHeight)];
//    _overVc  = [[OverViewController alloc]init];
    _cover = [[UIView alloc]initWithFrame:self.view.bounds];
}

// 随机4位
- (void)chooesFourPerson{
    _showDic = [NSMutableDictionary dictionaryWithCapacity:4];
    NSMutableArray <PersonView * >* tempArr = [NSMutableArray arrayWithArray:self.niaojiArray];
    NSInteger num = 4;
    for (NSInteger i = 0; i < num; i++) {
        NSInteger t = arc4random() % tempArr.count;
        [_showDic setObject:tempArr[t] forKey:[NSString stringWithFormat:@"%ld",i]];
        tempArr[t] = [tempArr lastObject];
        [tempArr removeLastObject];
    }
    
    // 反过来添加
    for (NSInteger i = num - 1; i >= 0; i--) {
        [_niaojiRoadView addSubview:[_showDic objectForKey:[NSString stringWithFormat:@"%ld",i]]];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 展出人物
        [self showPerson];
    });
}

- (void)showPerson{
    /*
     位置
     3          位置1
     2          位置2
     1          位置3
     0          位置4
     */
    // 位置1
    PersonView * three = [_showDic objectForKey:@"3"];
    [UIView animateWithDuration:MoveTime animations:^{
        three.tw_y = FourthY - ManHeight * 1.5;
    }];
    // 位置2
    PersonView * second = [_showDic objectForKey:@"2"];
    [UIView animateWithDuration:MoveTime / 1.3 animations:^{
        second.tw_y = FourthY - ManHeight;
    }];
    // 位置3
    PersonView * one = [_showDic objectForKey:@"1"];
    [UIView animateWithDuration:MoveTime / 2  animations:^{
        one.tw_y = FourthY - ManHeight / 2;
    }];
    // 位置4
    PersonView * zore = [_showDic objectForKey:@"0"];
    [UIView animateWithDuration:MoveTime / 4 animations:^{
        zore.tw_y = FourthY;
    }];
}

- (void)setupPerson{
    _man1 = [[ManImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
    _man2 = [[ManImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
    _man3 = [[ManImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
    _man4 = [[ManImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
    _woman1 = [[WomanImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
    _woman2 = [[WomanImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
    _woman3 = [[WomanImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
    _woman4 = [[WomanImageView alloc]initWithFrame:CGRectMake(0, -ManHeight, ManWidth, ManHeight)];
}

// 随机取出另一个人物（不能重复）
- (PersonView *)randomOnePersonNotincluded:(NSMutableDictionary *)dict{
    NSMutableArray * temp = [NSMutableArray arrayWithArray:_niaojiArray];
    for (NSInteger i = 0; i < dict.count; i++) {
        [temp removeObject:[dict objectForKey:[NSString stringWithFormat:@"%ld",i]]];
    }
    NSInteger t = arc4random() % temp.count;
    return temp[t];
}

- (IBAction)leftTapClick:(UIButton *)sender {
    // 增加一个
    PersonView * newPerson = [self randomOnePersonNotincluded:_showDic];
    
    // 原字典
    PersonView * three = [_showDic objectForKey:@"3"];
    PersonView * second = [_showDic objectForKey:@"2"];
    PersonView * one = [_showDic objectForKey:@"1"];
    PersonView * zore = [_showDic objectForKey:@"0"];
    
    [self.view addSubview:_cover];
    [UIView animateWithDuration:MoveTime / 5 animations:^{
        zore.tw_x = -TWScreenWidth * 0.25;
    } completion:^(BOOL finished) {
        [_manDoorImageView beginAnimation];
        if ([zore.sex isEqualToString: @"Man"]) {
            _inCount ++;
            _scoreLabel.text = [NSString stringWithFormat:@"%ld",_inCount];
            [_cover removeFromSuperview];
        } else {
            [self.view addSubview:_womanOut];
            [UIView animateWithDuration:MoveTime / 5 animations:^{
                _womanOut.tw_centerX = _niaojiRoadView.tw_centerX;
            } completion:^(BOOL finished) {
                [_womanOut removeFromSuperview];
                [self.view addSubview:_womanToukan];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [_womanToukan removeFromSuperview];
                    [_cover removeFromSuperview];
                    
//                    // 保存最新数据
//                    NSInteger max = [[NSUserDefaults standardUserDefaults] integerForKey:InCount];
//                    if (max == 0) {
//                        // 第一次直接保存
//                        [[NSUserDefaults standardUserDefaults] setInteger:_inCount forKey:InCount];
//                        [[NSUserDefaults standardUserDefaults] synchronize];
////                        [_overVc showWinImageView];
//                    } else {
//                        if (max <= _inCount) {
////                            // 比已经保存的值大就覆盖保存
////                            [[NSUserDefaults standardUserDefaults] setInteger:_inCount forKey:InCount];
////                            [[NSUserDefaults standardUserDefaults] synchronize];
////                            [_overVc showWinImageView];
//                        } else {
//                            // 否则就不保存
////                            [_overVc showLoseImageView];
//                        }
//                    }
                    
                    // 跳转到over页面
                    OverViewController * overVc  = [[OverViewController alloc]init];
                    overVc.score = _inCount;
                    overVc.block = ^{
                        _inCount = 0;
                        _scoreLabel.text = [NSString stringWithFormat:@"%ld",_inCount];
                    };
                    overVc.modalPresentationStyle = UIModalPresentationCustom;
                    [self presentViewController:overVc animated:NO completion:nil];
                });
            }];
        }
        [zore removeFromSuperview];
        [_showDic removeObjectForKey:@"0"];
        
        // 更改编号
        NSMutableDictionary * temp = [NSMutableDictionary dictionaryWithCapacity:4];
        [temp setObject:one forKey:@"0"];
        [temp setObject:second forKey:@"1"];
        [temp setObject:three forKey:@"2"];
        [_showDic removeAllObjects];
        _showDic = temp;
        [UIView animateWithDuration:MoveTime / 5 animations:^{
            three.tw_y = FourthY - ManHeight;
            second.tw_y = FourthY - ManHeight / 2;
            one.tw_y = FourthY;
        }];
        
        // 增加一个新的
        newPerson.backgroundColor = TWRandomColor;
        newPerson.frame = CGRectMake(0, -ManHeight, ManWidth, ManHeight);
        [_niaojiRoadView insertSubview:newPerson atIndex:0];
        [_showDic setObject:newPerson forKey:@"3"];
        [UIView animateWithDuration:MoveTime / 5 animations:^{
            newPerson.tw_y = FourthY - ManHeight * 1.5;
        }];
    }];
}

- (IBAction)rightTapClick:(UIButton *)sender {
    // 增加一个
    PersonView * newPerson = [self randomOnePersonNotincluded:_showDic];
    
    // 原字典
    PersonView * three = [_showDic objectForKey:@"3"];
    PersonView * second = [_showDic objectForKey:@"2"];
    PersonView * one = [_showDic objectForKey:@"1"];
    PersonView * zore = [_showDic objectForKey:@"0"];
    
    [self.view addSubview:_cover];
    [UIView animateWithDuration:MoveTime / 5 animations:^{
        zore.tw_x = TWScreenWidth * 0.25;
    } completion:^(BOOL finished) {
        [_womanDoorImageView beginAnimation];
        if ([zore.sex isEqualToString: @"Woman"]) {
            _inCount ++;
            _scoreLabel.text = [NSString stringWithFormat:@"%ld",_inCount];
            [_cover removeFromSuperview];
        } else {
            [self.view addSubview:_manOut];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _manOut.image = [UIImage imageNamed:@"man_out2"];
                [UIView animateWithDuration:MoveTime / 5 animations:^{
                    _manOut.tw_centerX = _niaojiRoadView.tw_centerX;
                } completion:^(BOOL finished) {
                    [_manOut removeFromSuperview];
                    [self.view addSubview:_manToukan];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [_manToukan removeFromSuperview];
                        [_cover removeFromSuperview];
                        
//                        // 保存最新数据
//                        NSInteger max = [[NSUserDefaults standardUserDefaults] integerForKey:InCount];
//                        if (max == 0) {
//                            // 第一次直接保存
//                            [[NSUserDefaults standardUserDefaults] setInteger:_inCount forKey:InCount];
//                            [[NSUserDefaults standardUserDefaults] synchronize];
////                            [_overVc showWinImageView];
//                        } else {
//                            if (max <= _inCount) {
////                                // 比已经保存的值大就覆盖保存
////                                [[NSUserDefaults standardUserDefaults] setInteger:_inCount forKey:InCount];
////                                [[NSUserDefaults standardUserDefaults] synchronize];
////                                [_overVc showWinImageView];
//                            } else {
//                                // 否则就不保存
////                                [_overVc showLoseImageView];
//                            }
//                        }
                        
                        // 跳转到over页面
                        OverViewController * overVc  = [[OverViewController alloc]init];
                        overVc.score = _inCount;
                        overVc.block = ^{
                            _inCount = 0;
                            _scoreLabel.text = [NSString stringWithFormat:@"%ld",_inCount];
                        };
                        overVc.modalPresentationStyle = UIModalPresentationCustom;
                        [self presentViewController:overVc animated:NO completion:nil];
                    });
                }];
                
            });
        }
        [zore removeFromSuperview];
        [_showDic removeObjectForKey:@"0"];
        
        // 更改编号
        NSMutableDictionary * temp = [NSMutableDictionary dictionaryWithCapacity:4];
        [temp setObject:one forKey:@"0"];
        [temp setObject:second forKey:@"1"];
        [temp setObject:three forKey:@"2"];
        [_showDic removeAllObjects];
        _showDic = temp;
        
        [UIView animateWithDuration:MoveTime / 5 animations:^{
            three.tw_y = FourthY - ManHeight;
            second.tw_y = FourthY - ManHeight / 2;
            one.tw_y = FourthY;
        }];
        
        // 增加一个
        newPerson.backgroundColor = TWRandomColor;
        newPerson.frame = CGRectMake(0, -ManHeight, ManWidth, ManHeight);
        [_niaojiRoadView insertSubview:newPerson atIndex:0];
        [_showDic setObject:newPerson forKey:@"3"];
        [UIView animateWithDuration:MoveTime / 5 animations:^{
            newPerson.tw_y = FourthY - ManHeight * 1.5;
        }];
    }];
}
@end
