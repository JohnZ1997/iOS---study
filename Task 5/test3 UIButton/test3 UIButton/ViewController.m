//
//  ViewController.m
//  test3 UIButton
//
//  Created by 张皓 on 4/22/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *customButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpButton];
}

- (void) setUpButton {
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    btn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btn];
    
    [btn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"2.jpg"]  forState:UIControlStateHighlighted];
    
    [btn setTitle:@"normal" forState:UIControlStateNormal];
    
    [btn setTitle:@"hightlighted" forState:UIControlStateHighlighted];

    UIView
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)stateButton:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self.customButton setSelected:YES];
            [self.customButton setEnabled:YES];
            break;
        case 2:
            [self.customButton setEnabled:NO];
            [self.customButton setSelected:NO];
            break;
        default:
            [self.customButton setEnabled:YES];
            [self.customButton setSelected:NO];
            break;
    }
}

@end
