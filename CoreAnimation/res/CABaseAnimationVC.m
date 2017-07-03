//
//  CABaseAnimationVC.m
//  CoreAnimation
//
//  Created by roc on 2017/7/2.
//  Copyright © 2017年 roc. All rights reserved.
//

#import "CABaseAnimationVC.h"

@interface CABaseAnimationVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UIView *testView;//测试view

@property(nonatomic,strong)UICollectionView *collectionView; //按钮组

@property(nonatomic,strong)NSMutableArray *buttonSource;//按钮的数据源

@end

@implementation CABaseAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化布局
    [self initView];
   
}

//初始化布局
-(void)initView{

    //测试view
    _testView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-50, 100, 100)];
    _testView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:_testView];
    
    //按钮组
    _buttonSource = [NSMutableArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 60);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-150, SCREEN_WIDTH, 150) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:nil] forCellWithReuseIdentifier:CELL_BUTTON_ID];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _buttonSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ButtonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_BUTTON_ID forIndexPath:indexPath];
    
    return cell;

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
