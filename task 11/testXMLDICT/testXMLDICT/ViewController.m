//
//  ViewController.m
//  testXMLDICT
//
//  Created by 张皓 on 16/8/5.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import "ViewController.h"
#import "XMLDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSXMLParser *paser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"questions" ofType:@"xml" ]]];

    NSDictionary *dict = [NSDictionary dictionaryWithXMLParser:paser];
    
    NSLog(@"%@", dict);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
