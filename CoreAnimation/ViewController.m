//
//  ViewController.m
//  CoreAnimation
//
//  Created by roc on 2017/6/30.
//  Copyright © 2017年 roc. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property(nonatomic,strong)UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //测试方法
    //[self testMethod];

    
    
    
}

-(void)testMethod{
    _testView = [[UIView alloc]init];
    _testView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
    _testView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_testView];
    
    
    /*-------iOS动画的调用方式-------*/
    
    //1.UIView 代码块调用
    /*
     [UIView animateWithDuration:10.0f animations:^{
     _testView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
     } completion:^(BOOL finished) {
     _testView.frame = CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50, 50, 50);
     }];*/
    
    //2.UIView [begin commit]模式
    /*
     [UIView beginAnimations:nil context:nil];
     [UIView setAnimationDuration:10.0];
     _testView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
     [UIView commitAnimations];*/
    
    //3.使用Core Animation中的类
    /*
     CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
     anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
     anima.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
     anima.duration = 10.0;
     anima.fillMode = kCAFillModeForwards;
     anima.removedOnCompletion = NO;
     [_testView.layer addAnimation:anima forKey:@"positionAnimation"];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
