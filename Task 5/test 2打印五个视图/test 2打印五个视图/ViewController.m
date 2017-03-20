//
//  ViewController.m
//  test 2打印五个视图
//
//  Created by 张皓 on 4/22/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *cyanView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = [[NSArray alloc] initWithObjects:
                    self.blueView,
                    self.cyanView,
                    self.redView,
                    self.whiteView,
                    self.greenView,
                    nil];
    
//    数组打印
    for (int i=0; i<5; i++) {
        [self printview:arr[i]];
    }
    //依次打印blueView的 frame bounds center
    NSLog(@"blueView");
    [self printview:self.blueView];
    
    //依次打印cyanView的 frame bounds center
    NSLog(@"cyanView");
    [self printview:self.cyanView];
    
    //依次打印redView的 frame bounds center
    NSLog(@"redView");
    [self printview:self.redView];
    
    //依次打印whiteView的 frame bounds center
    NSLog(@"whiteView");
    [self printview:self.whiteView];
    
    //依次打印greenView的 frame bounds center
    NSLog(@"greenView");
    [self printview:self.greenView];
    
}

- (void)printview: (UIView*)view{
    NSLog(@"frame: %@",NSStringFromCGRect (view.frame));
    NSLog(@"bounds: %@",NSStringFromCGRect (view.bounds));
    NSLog(@"center: %@",NSStringFromCGPoint(view.center));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
