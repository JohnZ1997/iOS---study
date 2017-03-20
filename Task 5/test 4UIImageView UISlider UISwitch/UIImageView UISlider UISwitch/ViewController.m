//
//  ViewController.m
//  UIImageView UISlider UISwitch
//
//  Created by 张皓 on 4/22/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mySwitch addTarget: self action:@selector(switchOfSlider) forControlEvents:UIControlEventTouchUpInside];
    [self.mySlider addTarget:self action:@selector(slider) forControlEvents:UIControlEventValueChanged];
    [self setUpImageView];
    
}

- (void)switchOfSlider{
    if (self.mySwitch.isOn) {
        self.mySlider.enabled = YES;
    }else{
        self.mySlider.enabled = NO;
    }
}

- (void)slider{
    self.myImage.alpha = self.mySlider.value / 100;
}

//创建 imageview 的方法
- (void)setUpImageView{
//    创建对象
    UIImageView * myImageAnother = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 160)];
//    指定图片
    [myImageAnother setImage: [UIImage imageNamed:@"2.jpg"]];
//    背景颜色
    myImageAnother.backgroundColor = [UIColor redColor];
//    指定图片填充方式
    myImageAnother.contentMode = UIViewContentModeScaleAspectFit;
//    添加到view
    [self.view addSubview:myImageAnother];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
