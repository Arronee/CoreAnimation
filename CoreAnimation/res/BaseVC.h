//
//  BaseVC.h
//  CoreAnimation
//
//  Created by roc on 2017/7/2.
//  Copyright © 2017年 roc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface BaseVC : UIViewController

@property(nonatomic,strong)UIView *testView;//测试view

@property(nonatomic,strong)NSMutableArray *buttonSource;//按钮的数据源

//按钮的点击事件
-(void)didSelectedButton:(NSIndexPath *)indexpath;

@end
