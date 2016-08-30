//
//  ViewController.m
//  LifeTree
//
//  Created by yang on 16/8/26.
//  Copyright © 2016年 danertu.inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIScrollView *girdView;
    NSInteger girdHeight;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //延迟启动图片
    [NSThread sleepForTimeInterval:3];
    
    // Do any additional setup after loading the view, typically from a nib.
    
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
    
    
    NSInteger bottomH = 100;
    UIImageView *bottomView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trunkRoot"]];
    bottomView.backgroundColor = [UIColor clearColor];
    bottomView.frame = CGRectMake(0, girdHeight-bottomH, SCREENWIDTH, bottomH);
    [girdView addSubview:bottomView];
    
    NSInteger trunkH = 700;
    UIImageView *trunkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trunk"]];
    trunkView.backgroundColor = [UIColor clearColor];
    trunkView.frame = CGRectMake(0, girdHeight-trunkH-bottomH, SCREENWIDTH, trunkH);
    [girdView addSubview:trunkView];
    
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 50, 20)];
    bt.backgroundColor = [UIColor redColor];
    [bt.layer setMasksToBounds:YES];
    [bt.layer setCornerRadius:2];
    [bt setTitle:@"点" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    
    
    
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

@end
