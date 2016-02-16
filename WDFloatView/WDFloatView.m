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
        self.mainView = mainView;
        self.promptView = promptView;
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

- (void)swtichAction {
    __weak WDFloatView* weakSelf = (WDFloatView *)self;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        if (weakSelf.isMain) {
            weakSelf.frame = CGRectMake(weakSelf.frame.origin.x, weakSelf.frame.origin.y, weakSelf.promptView.bounds.size.width, weakSelf.promptView.bounds.size.height);
            
            weakSelf.mainView.alpha = 0.0;
            weakSelf.promptView.alpha = 1.0;
        } else {
            weakSelf.frame = CGRectMake(weakSelf.frame.origin.x, weakSelf.frame.origin.y, weakSelf.mainView.bounds.size.width, weakSelf.mainView.bounds.size.height);
            
            weakSelf.mainView.alpha = 1.0;
            weakSelf.promptView.alpha = 0.0;
        }
        [weakSelf.superview layoutIfNeeded];
        weakSelf.isMain = !weakSelf.isMain;
    } completion:^(BOOL finished) {
        
    }];
    
}

@end
