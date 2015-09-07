//
//  ViewController.m
//  HYChoiceDate
//
//  Created by heyang on 15/9/7.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYCoverView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)TEST:(id)sender {
    
    /** 创建*/
    HYCoverView *coverView = [[HYCoverView alloc] initWithView:self.view];
    
    [self.view addSubview:coverView];
    
    /** block回调传值*/
    coverView.cellSelectedHandler = ^(NSString *aString)
    {
        NSLog(@"当前选中日期:%@",aString);
    };
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
