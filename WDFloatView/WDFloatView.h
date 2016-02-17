//
//  WDFloatView.h
//  WDFloatView
//
//  Created by 吴迪玮 on 16/2/16.
//  Copyright © 2016年 DNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WDFloatViewDelegate <NSObject>

- (void)switchCompletion;

@end

@interface WDFloatView : UIView

@property (weak, nonatomic) id<WDFloatViewDelegate> delegate;

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIView *promptView;

@property (strong, nonatomic) UIButton *promptBtn;

/**
 *  是否显示主View中
 */
@property (nonatomic) BOOL isMain;

-(instancetype)initWithOrignPoint:(CGPoint)orign mainView:(UIView *)mainView promptView:(UIView *)promptView;

-(void)animatedSetIsMain:(BOOL)isMain;

- (CGFloat)currentHeight;

@end
