# HYChoiceDate
日期选择(底部弹出视图)
 
 
 -(IBAction)TEST:(id)sender {
    
    /** 创建*/
    
    
    HYCoverView *coverView = [[HYCoverView alloc] initWithView:self.view];
    
    [self.view addSubview:coverView];
    
    
    
    
    /** block回调传值*/
    
    
    coverView.cellSelectedHandler = ^(NSString *aString)
    {
        NSLog(@"当前选中日期:%@",aString);
    };
}
