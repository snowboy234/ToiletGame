//
//  HomeToGameAnimation.h
//  ToiletGame
//
//  Created by 田伟 on 2017/8/21.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeToGameAnimationDelegate <NSObject>
- (UIImageView *)getRightScreenImage;
@end

@interface HomeToGameAnimation : NSObject<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
+ (HomeToGameAnimation *)shareHomeToGameAnimation;
@property (nonatomic, weak) id <HomeToGameAnimationDelegate> delegate;

@end
