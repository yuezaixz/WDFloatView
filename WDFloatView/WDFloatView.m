//
//  WDFloatView.m
//  WDFloatView
//
//  Created by 吴迪玮 on 16/2/16.
//  Copyright © 2016年 DNT. All rights reserved.
//

#import "WDFloatView.h"

#define TITLE_VIEW_HEIGHT 38

@interface WDFloatView()

@property (strong, nonatomic) UIView *titleView;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation WDFloatView{
    UITapGestureRecognizer *touchToMainGesture;
    UITapGestureRecognizer *touchToPromptGesture;
}

@synthesize titleFont = _titleFont;

-(void)awakeFromNib{
    self.clipsToBounds = YES;
    _isMain = YES;
    [self addSubview:self.promptBtn];
}

-(instancetype)initWithOrignPoint:(CGPoint)orign mainView:(UIView *)mainView promptView:(UIView *)promptView{
    self = [super initWithFrame:CGRectMake(orign.x, orign.y, CGRectGetWidth(self.mainView.frame), CGRectGetHeight(self.promptView.frame)+TITLE_VIEW_HEIGHT)];
    if (self) {
        self.clipsToBounds = YES;
        _isMain = YES;
        
        
        self.mainView = mainView;
        self.promptView = promptView;
        self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.mainView.frame), TITLE_VIEW_HEIGHT)];
        self.titleView.backgroundColor = self.titleViewColor;
        self.titleLabel = [[UILabel alloc] init];
        
        self.mainView.frame = CGRectMake(self.mainView.frame.origin.x,
                                         self.mainView.frame.origin.y+TITLE_VIEW_HEIGHT,
                                         CGRectGetWidth(self.mainView.frame),
                                         CGRectGetHeight(self.mainView.frame));
        self.promptView.frame = CGRectMake(self.promptView.frame.origin.x,
                                           self.promptView.frame.origin.y+TITLE_VIEW_HEIGHT,
                                           CGRectGetWidth(self.promptView.frame),
                                           CGRectGetHeight(self.promptView.frame));
        
        [self addSubview:self.titleView];
        [self.titleView addSubview:self.titleLabel];
        [self addSubview:self.mainView];
        [self addSubview:self.promptView];
        self.promptView.alpha = 0.0;
    }
    return self;
}

-(void)setPromptBtn:(UIButton *)promptBtn{
    _promptBtn = promptBtn;
    [_promptBtn addTarget:self action:@selector(swtichAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_promptBtn];
}

-(void)setMainView:(UIView *)mainView{
    _mainView = mainView;
    [self insertSubview:_mainView belowSubview:self.promptBtn];
    if (self.isMain) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _mainView.bounds.size.width, _mainView.bounds.size.height+TITLE_VIEW_HEIGHT);
    }
    
}

-(void)setPromptView:(UIView *)promptView{
    _promptView = promptView;
    [self insertSubview:_promptView belowSubview:self.promptBtn];
    if (!self.isMain) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _promptView.bounds.size.width, _promptView.bounds.size.height+TITLE_VIEW_HEIGHT);
    }
}

- (void)swtichAction {
    [self animatedSetIsMain:!self.isMain];
}

-(void)setFloatViewTitle:(NSString *)floatViewTitle{
    _floatViewTitle = floatViewTitle;
    [self reloadTitleLabel];
}

-(void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    [self reloadTitleLabel];
}

- (void)reloadTitleLabel {
    self.titleLabel.font = self.titleFont;
    self.titleLabel.textColor = self.titleColor;
    self.titleLabel.text = self.floatViewTitle;
    [self.titleLabel sizeToFit];
    self.titleLabel.center = CGPointMake(CGRectGetWidth(self.titleView.bounds)/2, CGRectGetHeight(self.titleView.bounds)/2);
}

-(void)setIsMain:(BOOL)isMain{
    _isMain = isMain;
    
    if (!isMain) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.promptView.bounds.size.width, self.promptView.bounds.size.height+TITLE_VIEW_HEIGHT);
        
        self.mainView.alpha = 0.0;
        self.promptView.alpha = 1.0;
    } else {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.mainView.bounds.size.width, self.mainView.bounds.size.height+TITLE_VIEW_HEIGHT);
        
        self.mainView.alpha = 1.0;
        self.promptView.alpha = 0.0;
    }
}

-(void)canTouchToMain:(BOOL)canTouchToMain{
    if (canTouchToMain) {
        touchToMainGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swtichAction)];
        [self.promptView addGestureRecognizer:touchToMainGesture];
    } else {
        [self.promptView removeGestureRecognizer:touchToMainGesture];
    }
}

-(void)canTouchToPrompt:(BOOL)canTouchToPrompt{
    if (canTouchToPrompt) {
        touchToPromptGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swtichAction)];
        [self.mainView addGestureRecognizer:touchToPromptGesture];
    } else {
        [self.mainView removeGestureRecognizer:touchToPromptGesture];
    }
}

-(void)animatedSetIsMain:(BOOL)isMain{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.isMain = isMain;
        if (self.delegate && [self.delegate respondsToSelector:@selector(switchCompletion)]) {
            [self.delegate switchCompletion];
        }
    } completion:^(BOOL finished) {
    }];
}

- (CGFloat)currentHeight{
    return (self.isMain?self.mainView.bounds.size.height:self.promptView.bounds.size.height) + TITLE_VIEW_HEIGHT;
}

-(UIFont *)titleFont{
    if (!_titleFont) {
        _titleFont = [UIFont fontWithName:@"PingFangSC-Medium" size:16.0];
    }
    return _titleFont;
}

-(UIColor *)titleViewColor{
    if (!_titleViewColor) {
        _titleViewColor = [UIColor colorWithRed:33.0/255 green:24.0/255 blue:45.0/255 alpha:1];
    }
    return _titleViewColor;
}

-(UIColor *)titleColor{
    if (!_titleColor) {
        _titleColor = [UIColor whiteColor];
    }
    return _titleColor;
}

@end
