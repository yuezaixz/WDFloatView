# WDFloatView
一个View控件，点击UiView或者右上角按钮后浮动出提示的View，再同样的操作返回主View

##应用场景
主要应用于需要一个主界面，显示一些数据。但是这些数据缺乏自解释能力，点击右上角问号或者点击View本身去切换状态，显示解释页面。

##简单易用
控件比较小，不需要什么pod管理，直接将View拖入工程即可

```objc
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
```


