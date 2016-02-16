//
//  ViewController.m
//  WDFloatView
//
//  Created by 吴迪玮 on 16/2/16.
//  Copyright © 2016年 DNT. All rights reserved.
//

#import "ViewController.h"
#import "WDFloatView.h"

@interface ViewController ()

@property (strong, nonatomic) WDFloatView *floatView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    self.floatView = [[WDFloatView alloc] initWithOrignPoint:CGPointMake(0, 40) mainView:mainView promptView:promptView];
    //这两个设置主要是为了显示效果更明显设置
    self.floatView.layer.borderColor = [UIColor blackColor].CGColor;
    self.floatView.layer.borderWidth = 2.0;
    [self.view addSubview:self.floatView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
