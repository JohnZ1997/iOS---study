//
//  ViewController.m
//  scrollView123
//
//  Created by 张皓 on 16/5/13.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import "ViewController.h"
#import "BannerVIew.h"

#define picWidth self.view.bounds.size.width
#define picHeight self.view.bounds.size.height
#define VIEW_FRAME self.view.bounds

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView* myScrollview;

@property (nonatomic, strong) UIImageView* currentImg;

@property (nonatomic, strong) UIImageView* leftImg;

@property (nonatomic, strong) UIImageView* rightImg;

@property (nonatomic, strong) NSTimer* timer1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self myScrollview];
    [self currentImg];
    [self rightImg];
    [self leftImg];
    
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clock) userInfo:nil repeats:YES];
}

- (void)clock {
    
    static int a = 0;
    a++;
    if (a >= 3) {
        a = 0;
    }
    
    
    self.myScrollview.contentOffset = CGPointMake(picWidth*a, 0);
    
}

-(UIImageView *)currentImg{
    if (!_currentImg) {
        _currentImg = [[UIImageView alloc]initWithFrame:CGRectMake(picWidth, 0, picWidth, picHeight)];
        
        _currentImg.image = [UIImage imageNamed:@"1.jpeg"];
        [self.myScrollview addSubview:_currentImg];
    }
    
    return _currentImg;
}

-(UIImageView *)rightImg{
    if (!_rightImg) {
        _rightImg = [[UIImageView alloc]initWithFrame:CGRectMake(picWidth*2, 0, picWidth, picHeight)];
        
        _rightImg.image = [UIImage imageNamed:@"2.png"];
        [self.myScrollview addSubview:_rightImg];
    }
    
    return _rightImg;
}

-(UIImageView *)leftImg{
    if (!_leftImg) {
        _leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, picWidth, picHeight)];
        
        _leftImg.image = [UIImage imageNamed:@"3.jpeg"];
        [self.myScrollview addSubview:_leftImg];
    }
    
    return _leftImg;
}

-(UIScrollView *)myScrollview{
    if (!_myScrollview) {
//        _myScrollview = [[UIScrollView alloc]initWithFrame:VIEW_FRAME];
//        _myScrollview.backgroundColor = [UIColor redColor];
//        [self.view addSubview:_myScrollview];
//        
//        _myScrollview.contentSize = CGSizeMake(picWidth*3, picHeight);
//        
//        _myScrollview.bounces = NO;
//        
//        _myScrollview.pagingEnabled = YES;
//        
//        _myScrollview.delegate = self;
        
//        _myScrollview = []
    }
    
    return _myScrollview;
}



@end
