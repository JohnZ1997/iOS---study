//
//  ViewController.m
//  test1_singersbrowser
//
//  Created by 张皓 on 4/24/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import "ViewController.h"
#import "singerModel.h"

@interface ViewController ()

//set up a array to store the data of singer
@property(nonatomic, strong) NSMutableArray* arrayAll;

//show title
@property(nonatomic, strong) UILabel* titleL;

//top title
@property(nonatomic, strong) UILabel* topTitleL;

//show singer picture
@property(nonatomic, strong) UIImageView* imageView;

//show a back button
@property(nonatomic, strong) UIButton* btnBack;

//show a next button
@property(nonatomic, strong) UIButton* btnNext;

//count the number of piece
@property(nonatomic, assign) int iIndex;




@end

@implementation ViewController

#pragma mark set up title lazy laoding
- (UILabel*) titleL {
    if (!_titleL) {
        _titleL = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150, 90, 300, 40)];
        _titleL.backgroundColor = [UIColor cyanColor];
        _titleL.textAlignment = 1;
        
        [self.view addSubview:_titleL];
    }
    
    return _titleL;
}

#pragma mark set up top title
- (UILabel*) topTitleL {
    if (!_topTitleL) {
        _topTitleL = [[UILabel alloc]initWithFrame: CGRectMake(self.view.center.x-100, 40, 200, 30)];
        _topTitleL.text = @"American singer";
        
        [self.view addSubview:self.topTitleL];
        _topTitleL.textAlignment = 1;
    }
    return _topTitleL;
}

#pragma mark set up an imageView to show picture of singer
- (UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150, 130, 300, 300)];
        _imageView.backgroundColor = [UIColor whiteColor];
    
        [self.view addSubview:_imageView];
    }
    
    return _imageView;
}

#pragma mark set up back button
- (UIButton*)btnBack {
    if (!_btnBack) {
        _btnBack = [[UIButton alloc] initWithFrame:CGRectMake(70, 460, 100, 40)];
        _btnBack.backgroundColor = [UIColor cyanColor];
        [_btnBack setTitle:@"BACK" forState:UIControlStateNormal];
        
        [_btnBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btnBack];
    }
    
    return _btnBack;
}

#pragma mark set up next button
- (UIButton*)btnNext {
    if (!_btnNext) {
        _btnNext = [[UIButton alloc] initWithFrame:CGRectMake(190, 460, 100, 40)];
        _btnNext.backgroundColor = [UIColor cyanColor];
        [_btnNext setTitle:@"NEXT" forState:UIControlStateNormal];
        
        [_btnNext addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btnNext];
    }
    
    return _btnNext;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self currentPage:0];
    
    
    
    
    

}

#pragma mark set up the lazy loading of arrayAll
- (NSMutableArray*) arrayAll {
    if (!_arrayAll) {
        _arrayAll = [NSMutableArray array];
        
        //get address
        NSString *strpath = [[NSBundle mainBundle] pathForResource:@"picList.plist" ofType:nil];
        
        //read documents
        NSArray *singerArr = [NSArray arrayWithContentsOfFile:strpath];
        
        //analyze data
        for (NSDictionary* dict in singerArr) {
            singerModel* model = [singerModel singerModelWithDict:dict];
            
            [_arrayAll addObject:model];
        }
    }
    return _arrayAll;
}

#pragma mark last piece
- (void)back {
    if (self.iIndex > 0 ) {
        self.iIndex --;
        [self currentPage:self.iIndex];
    }
}

#pragma mark next piece
- (void)next {
    if (self.iIndex < self.arrayAll.count-1) {
        self.iIndex ++;
        [self currentPage:self.iIndex];
    }
    
}

//show current page
- (void)currentPage:(int) iPage{
   
    if (iPage>=0 && iPage<self.arrayAll.count) {
        singerModel* model = self.arrayAll[iPage];
        NSString *strTitle = [NSString stringWithFormat:@"%@ %d/%lu",model.name, iPage+1, (unsigned long)self.arrayAll.count];
        self.titleL.text = strTitle;
        
        self.imageView.image = [UIImage imageNamed:model.pic];
        
        self.topTitleL.backgroundColor = [UIColor greenColor];
        
        //if the current page is the first page, the back button is disable
        if (iPage == self.arrayAll.count-1) {
            self.btnNext.enabled = NO;
            self.btnNext.backgroundColor = [UIColor grayColor];
        } else {
            self.btnNext.enabled = YES;
            self.btnNext.backgroundColor = [UIColor cyanColor];

        }
        if (self.iIndex > 0) {
            self.btnBack.enabled = YES;
            self.btnBack.backgroundColor = [UIColor cyanColor];
        } else {
            self.btnBack.backgroundColor = [UIColor grayColor];
            self.btnBack.enabled = NO;
        }


    }
    
    
}


@end
