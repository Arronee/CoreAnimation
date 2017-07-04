//
//  BaseVC.m
//  CoreAnimation
//
//  Created by roc on 2017/7/2.
//  Copyright © 2017年 roc. All rights reserved.
//

#import "BaseVC.h"

//cell按钮的复用ID
#define CELL_BUTTON_ID  @"CELLBUTTON"

@interface BaseVC ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property(nonatomic,strong)UICollectionView *collectionView; //按钮组


@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化布局
    [self initView];
    
}
//初始化布局
-(void)initView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //返回按钮
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissBtn.frame = CGRectMake(0, 22,[UIScreen mainScreen].bounds.size.width , 60);
    [dismissBtn setTitle:@"返回" forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    dismissBtn.backgroundColor = [UIColor colorWithRed:129/255.0 green:207/255.0 blue:174/255.0 alpha:1.0];
    [self.view addSubview:dismissBtn];
    
    //测试view
    _testView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-50, 100, 100)];
    _testView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:_testView];
    
    //按钮组
    _buttonSource = [NSMutableArray array];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 60);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-150, SCREEN_WIDTH, 150) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor colorWithRed:129/255.0 green:207/255.0 blue:174/255.0 alpha:1.0];
    [self.view addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:nil] forCellWithReuseIdentifier:CELL_BUTTON_ID];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _buttonSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ButtonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_BUTTON_ID forIndexPath:indexPath];
    [cell.button setTitle:_buttonSource[indexPath.row] forState:UIControlStateNormal];
    cell.button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.button.layer.borderWidth = 2.0;
    cell.button.userInteractionEnabled = NO;
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self didSelectedButton:indexPath];
}
-(void)didSelectedButton:(NSIndexPath *)indexpath{

}
//返回按钮的点击事件
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
