//
//  BaseVC.m
//  CoreAnimation
//
//  Created by roc on 2017/7/2.
//  Copyright © 2017年 roc. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissBtn.frame = CGRectMake(0, 22,[UIScreen mainScreen].bounds.size.width , 60);
    [dismissBtn setTitle:@"返回" forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    dismissBtn.backgroundColor = [UIColor colorWithRed:129/255.0 green:207/255.0 blue:174/255.0 alpha:1.0];
    [self.view addSubview:dismissBtn];
    
}

-(void)dismiss:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
