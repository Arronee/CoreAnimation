//
//  ViewController.m
//  CoreAnimation
//
//  Created by roc on 2017/6/30.
//  Copyright © 2017年 roc. All rights reserved.
//

#import "ViewController.h"
#import "CABaseAnimationVC.h"
#import "CAKeyframeAnimationVC.h"
#import "CAAnimationGroupVC.h"
#import "CATransitionVC.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView *testView;

@property(nonatomic,strong)UITableView *listTable;

@property(nonatomic,strong)NSMutableArray *listSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //测试方法
    //[self testMethod];

    _listSource = [NSMutableArray arrayWithObjects:@"基础动画（CABaseAnimation)",@"关键帧动画（CAKeyframeAnimation）",@"组动画（CAAnimationGroup）",@"过渡动画（CATransition）", nil];
    
    _listTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 22, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _listTable.delegate = self;
    _listTable.dataSource = self;
    _listTable.tableFooterView = [UIView new];
    [self.view addSubview:_listTable];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _listSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IdentifierID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IdentifierID"];
    }
    cell.textLabel.text = _listSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            CABaseAnimationVC *baseAnimationVC = [[CABaseAnimationVC alloc]init];
            [self presentViewController:baseAnimationVC animated:YES completion:nil];

        }
            break;
        case 1:
        {
            CAKeyframeAnimationVC *keyframeAnimationVC = [[CAKeyframeAnimationVC alloc]init];
            [self presentViewController:keyframeAnimationVC animated:YES completion:nil];
        }
            break;
        case 2:
        {
            CAAnimationGroupVC *animationGroupVC = [[CAAnimationGroupVC alloc]init];
            [self presentViewController:animationGroupVC animated:YES completion:nil];
        }
            break;
        case 3:
        {
            CATransitionVC *transitionVC = [[CATransitionVC alloc]init];
            [self presentViewController:transitionVC animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
    
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
