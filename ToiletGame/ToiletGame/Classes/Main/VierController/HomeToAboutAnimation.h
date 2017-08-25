//
//  HomeToAboutAnimation.h
//  ToiletGame
//
//  Created by 田伟 on 2017/8/25.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeToAboutAnimationDelegate <NSObject>
- (UIImageView *)getLeftScreenImage;
@end
@interface HomeToAboutAnimation : NSObject<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

+ (HomeToAboutAnimation *)shareHomeToAboutAnimation;
@property (nonatomic, weak) id <HomeToAboutAnimationDelegate> delegate;


@end
