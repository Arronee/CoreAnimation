//
//  CABaseAnimationVC.m
//  CoreAnimation
//
//  Created by roc on 2017/7/2.
//  Copyright © 2017年 roc. All rights reserved.
//

#import "CABaseAnimationVC.h"

@interface CABaseAnimationVC ()


@end

@implementation CABaseAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //更改按钮组的数据源
    self.buttonSource = [NSMutableArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
    
    
}

//按钮的点击事件
-(void)didSelectedButton:(NSIndexPath *)indexpath{

    switch (indexpath.row) {
        case 0:             //位移的点击事件
            [self displacementTap];
            break;
        case 1:             //透明度的点击事件
            [self transparencyTap];
            break;
        case 2:             //缩放的点击事件
            [self zoomTap];
            break;
        case 3:             //旋转的点击事件
            [self rotationTap];
            break;
        case 4:             //背景色的点击事件
            [self backgroundColorTap];
            break;
        default:
            break;
    }
}

//位移的点击事件
-(void)displacementTap{

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(50, 200)];
    basicAnimation.duration = 5.0;
    basicAnimation.fillMode = kCAFillModeForwards;
    //用来设置动画执行结束之后，控件的位置，no即动画结束之后控件停留在动画结束之后的位置。
    basicAnimation.removedOnCompletion = NO;
    //结束后执行逆动画
    basicAnimation.autoreverses = YES;
    // 动画先加速后减速
    basicAnimation.timingFunction =
    [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    [self.testView.layer addAnimation:basicAnimation forKey:@"TEST"];
    
    //移除动画
    //[self.testView.layer removeAnimationForKey:@"TEST"];
}
//透明度的点击事件
-(void)transparencyTap{

}
//缩放的点击事件
-(void)zoomTap{
    
}
//旋转的点击事件
-(void)rotationTap{


}
//背景色的点击事件
-(void)backgroundColorTap{

}
@end
