//
//  WDFloatView.m
//  WDFloatView
//
//  Created by 吴迪玮 on 16/2/16.
//  Copyright © 2016年 DNT. All rights reserved.
//

#import "WDFloatView.h"

@implementation WDFloatView

-(instancetype)initWithOrignPoint:(CGPoint)orign mainView:(UIView *)mainView promptView:(UIView *)promptView{
    self = [super initWithFrame:CGRectMake(orign.x, orign.y, mainView.bounds.size.width, mainView.bounds.size.height)];
    if (self) {
        self.clipsToBounds = YES;
        _isMain = YES;
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swtichAction)];
        
        self.mainView = mainView;
        self.promptView = promptView;
        
        [self.mainView addGestureRecognizer:tapGes];
        tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swtichAction)];
        [self.promptView addGestureRecognizer:tapGes];
        self.promptBtn = ({
            UIButton *tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width-100-4, 4, 100, 40)];
            [tempBtn addTarget:self action:@selector(swtichAction) forControlEvents:UIControlEventTouchUpInside];
            tempBtn.backgroundColor = [UIColor purpleColor];
            tempBtn;
        });
        [self addSubview:self.mainView];
        [self addSubview:self.promptView];
        [self addSubview:self.promptBtn];
        self.promptView.alpha = 0.0;
    }
    return self;
}

-(void)setMainView:(UIView *)mainView{
    _mainView = mainView;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swtichAction)];
    [_mainView addGestureRecognizer:tapGes];
    [self insertSubview:_mainView belowSubview:self.promptBtn];
    if (self.isMain) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _mainView.bounds.size.width, _mainView.bounds.size.height);
    }
    
}

-(void)setPromptView:(UIView *)promptView{
    _promptView = promptView;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swtichAction)];
    [_promptView addGestureRecognizer:tapGes];
    [self insertSubview:_promptView belowSubview:self.promptBtn];
    if (!self.isMain) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _promptView.bounds.size.width, _promptView.bounds.size.height);
    }
}

- (void)swtichAction {
    self.isMain = !self.isMain;
}

-(void)setIsMain:(BOOL)isMain{
    _isMain = isMain;
    __weak WDFloatView* weakSelf = (WDFloatView *)self;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        if (!isMain) {
            weakSelf.frame = CGRectMake(weakSelf.frame.origin.x, weakSelf.frame.origin.y, weakSelf.promptView.bounds.size.width, weakSelf.promptView.bounds.size.height);
            
            weakSelf.mainView.alpha = 0.0;
            weakSelf.promptView.alpha = 1.0;
        } else {
            weakSelf.frame = CGRectMake(weakSelf.frame.origin.x, weakSelf.frame.origin.y, weakSelf.mainView.bounds.size.width, weakSelf.mainView.bounds.size.height);
            
            weakSelf.mainView.alpha = 1.0;
            weakSelf.promptView.alpha = 0.0;
        }

        [weakSelf.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

@end
