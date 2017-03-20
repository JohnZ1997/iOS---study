//
//  ViewController.m
//  use_autolayout_by_code
//
//  Created by 张皓 on 4/28/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //set three views
    UIView* myRedView = [[UIView alloc] init];
    myRedView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myRedView];
    
    UIView* myCyanView = [[UIView alloc] init];
    myCyanView.backgroundColor = [UIColor cyanColor];
    [myRedView addSubview:myCyanView];
    
    UIView* myGreenView = [[UIView alloc] init];
    myGreenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myGreenView];

    //ban resizing
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    myGreenView.translatesAutoresizingMaskIntoConstraints = NO;
    myRedView.translatesAutoresizingMaskIntoConstraints = NO;
    myCyanView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //set contraints by VFL
    NSArray* arrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[myredview]-20-[mygreenview(==myredview)]-20-|" options:NSLayoutFormatAlignAllBottom|NSLayoutFormatAlignAllTop metrics:nil views:@{@"myredview":myRedView, @"mygreenview": myGreenView}];
    [self.view addConstraints:arrH];
    
    NSArray* arrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[myredview(==200)]" options:0 metrics:nil views:@{@"myredview": myRedView}];
    [self.view addConstraints:arrV];
    
    
    //set constraints for cyanview
    //LEFT
    NSLayoutConstraint* constraintLeft = [NSLayoutConstraint constraintWithItem:myCyanView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:myRedView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [myRedView addConstraint:constraintLeft];
    
    //TOP
    NSLayoutConstraint* constriantTop = [NSLayoutConstraint constraintWithItem:myCyanView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:myRedView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [myRedView addConstraint:constriantTop];
    
    //HEIGHT
    NSLayoutConstraint* constrainHeight = [NSLayoutConstraint constraintWithItem:myCyanView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:myRedView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [myRedView addConstraint:constrainHeight];
    
    //WIDTH
    NSLayoutConstraint* constraintWidth = [NSLayoutConstraint constraintWithItem:myCyanView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:myRedView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [myRedView addConstraint:constraintWidth];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
