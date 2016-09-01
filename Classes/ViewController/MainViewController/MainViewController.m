//
//  MainViewController.m
//  LoveBaby
//
//  Created by 梅阳阳 on 15/4/23.
//  Copyright (c) 2015年 KingYang. All rights reserved.
//

#import "MainViewController.h"
//#import "FMDBManager.h"


#define SNOW_IMAGENAME         @"snow"
#define IMAGE_X                arc4random()%(int)[[UIScreen mainScreen] bounds].size.width
#define IMAGE_ALPHA            ((float)(arc4random()%10))/10
#define IMAGE_WIDTH            arc4random()%20 + 10
#define PLUS_HEIGHT            Main_Screen_Height/25

@interface MainViewController ()
{
    UIScrollView *girdView;
    NSInteger girdHeight;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //延迟启动图片
    [NSThread sleepForTimeInterval:3.0];

    
//    if ([[FMDBManager shareInstance] createDB]) {
//        NSLog(@"db 创建成功");
//    } else {
//        NSLog(@"db 创建失败");
//    }
    [self initView];
    
}

- (void)initView{
    girdHeight = SCREENHEIGH+500;
    girdView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGH)];
    [self.view addSubview:girdView];
    girdView.backgroundColor = [UIColor grayColor];
    girdView.showsVerticalScrollIndicator = NO;
    girdView.contentSize = CGSizeMake(SCREENWIDTH, girdHeight);
    girdView.delegate = self;
    
    
    NSInteger bottomH = 150;
    UIImageView *bottomView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trunkRoot"]];
    bottomView.backgroundColor = [UIColor clearColor];
    bottomView.frame = CGRectMake(-30, girdHeight-bottomH, SCREENWIDTH, bottomH);
    [girdView addSubview:bottomView];
    
    NSInteger trunkH = 700;
    UIImageView *trunkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trunk"]];
    trunkView.backgroundColor = [UIColor clearColor];
    trunkView.frame = CGRectMake(20, girdHeight-trunkH-bottomH, SCREENWIDTH-30, trunkH);
    [girdView addSubview:trunkView];
    
    
    
    NSInteger panelHeight = 100;
    for (int i = 0; i < 7; i++) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH/2-100, girdHeight-bottomH-panelHeight*(i+1), 200, 70)];
        bgView.backgroundColor = [UIColor yellowColor];
        bgView.tag = 100 + i;
        bgView.userInteractionEnabled = YES;
        [girdView addSubview:bgView];
        
        UITapGestureRecognizer *panelTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(panelClickAction:)];
        [bgView addGestureRecognizer:panelTap];
        
    }
    
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 50, 20)];
    bt.backgroundColor = [UIColor redColor];
    [bt.layer setMasksToBounds:YES];
    [bt.layer setCornerRadius:2];
    [bt setTitle:@"点" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    [self initItemView];
}

- (void)initItemView{
    
}

- (void)panelClickAction:(id)sender{
    UIView *clickView = (UIView *)[sender view];
    NSLog(@"tag:%ld",(long)clickView.tag);
}

- (void)clickAction{
    NSLog(@"111111");
}

#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float currentPosition = girdView.contentOffset.y;
    NSLog(@"girdView:%lf",currentPosition);
    //    [UIView animateWithDuration:0.3 animations:^{
    //        girdView.contentOffset = CGPointMake(0, scrollH);
    //    }];
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
