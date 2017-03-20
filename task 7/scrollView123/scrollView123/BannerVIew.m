//
//  BannerVIew.m
//  scrollView123
//
//  Created by 张皓 on 16/5/15.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import "BannerVIew.h"
@interface BannerVIew()<UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *picArray;
@property (nonatomic, strong) NSNumber *interval;
@property (nonatomic, strong) NSMutableArray *imgViewArray;


@end
@implementation BannerVIew
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

CGFloat kImgCount;//图片数量
CGFloat scrollY = 20;//pagecontrol距离下边距的距离
CGFloat pageControllWidth = 200;//pagecontroll宽度

#pragma 获取view实例的初始化方法
- (instancetype)initWithTimerAndImgs:(NSNumber *)timer imgs:(NSArray *)imgs
{
    if (self == [super init]) {
        //初始化view的frame
        self = [[BannerVIew alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        kImgCount = imgs.count;//照片的个数是数组的长度
        self.picArray = imgs;//从plist文件获取照片数组
        self.interval = @1;//给照片滚动设置默认时间
        [self initScrollView];//初始化scrollview
        [self initPageControll];
        [self addTimer:timer];
        
        
        
    }
    return self;
}


#pragma 初始化scrollview
- (void)initScrollView{
    
    //给scrollview设置边框
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    //设置delegate
    self.scrollView.delegate = self;
    
    
    self.imgViewArray = [[NSMutableArray alloc] init];
    
    //遍历数组加载图片
     for (int i=0; i<kImgCount; i++) {
         UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth*i, scrollY, kScreenWidth, kScreenHeight - scrollY)];
         imgView.image = [UIImage imageNamed:[NSString stringWithFormat:[self.picArray objectAtIndex:i], i+1]];
         [self.imgViewArray addObject:imgView.image];
         [self.scrollView addSubview:imgView];
    }
    
    //设置初始内容的size
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * kImgCount, kScreenHeight - 20);
    
    //设置pagingEnable属性
    self.scrollView.pagingEnabled = YES;
    
    //将scrollview加到view中
    [self addSubview:self.scrollView];

}

#pragma 初始化pagecontrol
- (void)initPageControll{
    //设置pagecontrol高度和位置
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth - pageControllWidth)/2, kScreenHeight - scrollY, pageControllWidth, scrollY)];
    
    //设置页数
    self.pageControl.numberOfPages = kImgCount;
    
    //设置默认页的样式
    self.pageControl.pageIndicatorTintColor = [UIColor greenColor];
    
    //设置当前页的样式
    self.pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    
    //加入view中， 放到scrollview上
    [self insertSubview:self.pageControl aboveSubview:self.scrollView];
    
}

#pragma 增加计时器
- (void) addTimer:(NSNumber *) interval{
    if (self.timer == nil) {
        //创建计时器
        self.timer = [NSTimer scheduledTimerWithTimeInterval:[interval floatValue] target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];//消息机制， 管理多线程
        
        
    }
}

#pragma 自动翻页的动作
- (void)nextPage{
    
    //获取当前页码
    NSInteger page = self.pageControl.currentPage;
    
    //当前页码加一，获取下一页
    page ++;
    
    //如果加一后， 与图片的个数相同，则回到第一张图片
    if (page == kImgCount) {
        page = 0;
    }
    
    //重新定位图片滚动的位置
    CGPoint point = CGPointMake(kScreenWidth * page, 0);
    [self.scrollView setContentOffset:point animated:true];
}

#pragma 滚动开始出发的事件
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //移除定时器
    [self removeTimer];
}

#pragma 滚动结束出发的事件
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //滚动结束后，重新添加定时器
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self.interval floatValue]*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTimer:self.interval];
    });
}

#pragma 移除定时器
- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark UIScrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //获取当前的页码数
    NSInteger page = scrollView.contentOffset.x / kScreenWidth + 0.5; //当前的页码数
    self.pageControl.currentPage = page;
}

#pragma 重置定时器的时间供外部调用
- (void)resetTimer:(NSNumber *)interval{
    self.interval = interval;
    [self removeTimer];
    [self addTimer:interval];
}

#pragma 动态增加图片， 供外部调用
- (void)addImageTOScroll:(UIImage *)newImage{
    kImgCount = kImgCount + 1;
    self.pageControl.numberOfPages = kImgCount;
    NSInteger currentPage = self.pageControl.currentPage;
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * kImgCount, kScreenHeight - 20);
    
    [self.imgViewArray insertObject:newImage atIndex:currentPage + 1];
    for (long i = currentPage; i<kImgCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        
        imgView.image = (UIImage*)[self.imgViewArray objectAtIndex:i];
        [self.scrollView addSubview:imgView];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
 
 
}
*/



@end
