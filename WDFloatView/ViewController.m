//
//  ViewController.m
//  WDFloatView
//
//  Created by 吴迪玮 on 16/2/16.
//  Copyright © 2016年 DNT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) WDFloatView *floatView1;
@property (strong, nonatomic) WDFloatView *floatView2;
@property (strong, nonatomic) WDFloatView *floatView3;
@property (strong, nonatomic) WDFloatView *floatView4;

@property (weak, nonatomic) IBOutlet UIView *floatConView1;
@property (weak, nonatomic) IBOutlet UIView *floatConView2;
@property (weak, nonatomic) IBOutlet UIView *floatConView3;
@property (weak, nonatomic) IBOutlet UIView *floatConView4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *floatConView1Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *floatConView2Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *floatConView3Height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *floatConView4Height;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        //主View，即该控件的默认状态
        UIView *mainView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
            tempView.backgroundColor = [UIColor yellowColor];
            tempView;
        });
        
        //提示View，即该控件的辅View，主要用于显示说明等功能
        UIView *promptView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
            tempView.backgroundColor = [UIColor blueColor];
            tempView;
        });
        
        self.floatView1 = [[WDFloatView alloc] initWithOrignPoint:CGPointMake(0, 0) mainView:mainView promptView:promptView];
        //这两个设置主要是为了显示效果更明显设置
        self.floatView1.layer.borderColor = [UIColor blackColor].CGColor;
        self.floatView1.layer.borderWidth = 2.0;
        self.floatView1.delegate = self;
        [self.floatConView1 addSubview:self.floatView1];
        
    }
    
    {
        //主View，即该控件的默认状态
        UIView *mainView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
            tempView.backgroundColor = [UIColor yellowColor];
            tempView;
        });
        
        //提示View，即该控件的辅View，主要用于显示说明等功能
        UIView *promptView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
            tempView.backgroundColor = [UIColor blueColor];
            tempView;
        });
        
        self.floatView2 = [[WDFloatView alloc] initWithOrignPoint:CGPointMake(0, 0) mainView:mainView promptView:promptView];
        //这两个设置主要是为了显示效果更明显设置
        self.floatView2.layer.borderColor = [UIColor blackColor].CGColor;
        self.floatView2.layer.borderWidth = 2.0;
        self.floatView2.delegate = self;
        [self.floatConView2 addSubview:self.floatView2];
        
    }
    
    {
        //主View，即该控件的默认状态
        UIView *mainView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
            tempView.backgroundColor = [UIColor yellowColor];
            tempView;
        });
        
        //提示View，即该控件的辅View，主要用于显示说明等功能
        UIView *promptView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
            tempView.backgroundColor = [UIColor blueColor];
            tempView;
        });
        
        self.floatView3 = [[WDFloatView alloc] initWithOrignPoint:CGPointMake(0, 0) mainView:mainView promptView:promptView];
        //这两个设置主要是为了显示效果更明显设置
        self.floatView3.layer.borderColor = [UIColor blackColor].CGColor;
        self.floatView3.layer.borderWidth = 2.0;
        self.floatView3.delegate = self;
        [self.floatConView3 addSubview:self.floatView3];
        
    }
    
    {
        //主View，即该控件的默认状态
        UIView *mainView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
            tempView.backgroundColor = [UIColor yellowColor];
            tempView;
        });
        
        //提示View，即该控件的辅View，主要用于显示说明等功能
        UIView *promptView = ({
            UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
            tempView.backgroundColor = [UIColor blueColor];
            tempView;
        });
        
        self.floatView4 = [[WDFloatView alloc] initWithOrignPoint:CGPointMake(0, 0) mainView:mainView promptView:promptView];
        //这两个设置主要是为了显示效果更明显设置
        self.floatView4.layer.borderColor = [UIColor blackColor].CGColor;
        self.floatView4.layer.borderWidth = 2.0;
        self.floatView4.delegate = self;
        [self.floatConView4 addSubview:self.floatView4];
        
    }
    [self switchCompletion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)switchCompletion{
    self.floatConView1Height.constant = [self.floatView1 currentHeight];
    self.floatConView2Height.constant = [self.floatView2 currentHeight];
    self.floatConView3Height.constant = [self.floatView3 currentHeight];
    self.floatConView4Height.constant = [self.floatView4 currentHeight];
    [self.view layoutSubviews];
}

@end
