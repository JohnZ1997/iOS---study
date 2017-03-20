//
//  ViewController.m
//  test1 简单的计算器
//
//  Created by 张皓 on 4/22/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textView1;//第一个输入框

@property (weak, nonatomic) IBOutlet UITextField *textView2;//第二个输入框



@property (weak, nonatomic) IBOutlet UILabel *result;//用于显示结果的标签

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView1.keyboardType = UIKeyboardTypeNumberPad;
    self.textView2.keyboardType = UIKeyboardTypePhonePad;
    
}
- (IBAction)caculate:(UIButton *)btn {
    NSString *strInput1 = self.textView1.text;
    NSString *strInput2 = self.textView2.text;
    
    float  fResult = 0;
    switch (btn.tag) {
        case 1:
            fResult = [strInput1 floatValue] + [strInput2 floatValue];
            break;
            
        case 2:
            fResult = [strInput1 floatValue] - [strInput2 floatValue];
            break;
            
        case 3:
            fResult = [strInput1 floatValue] * [strInput2 floatValue];
            break;
            
        default:
            fResult = [strInput1 floatValue] / [strInput2 floatValue];
            break;
    }
    
    if ([strInput2 floatValue]  == 0 && btn.tag == 4) {
        self.result.text = @"除数不能为0";
    } else{
        self.result.text = [NSString stringWithFormat:@"%0.2f",fResult];
    }
    
    
}




@end
