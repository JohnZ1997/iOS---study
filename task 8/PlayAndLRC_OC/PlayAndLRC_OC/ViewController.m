//
//  ViewController.m
//  PlayAndLRC_OC
//
//  Created by 张皓 on 16/5/22.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "LRCModel.h"
#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

@interface ViewController ()

@property (strong, nonatomic) UILabel         *lrcTextLabel; //显示歌词
@property (strong, nonatomic) AVAudioPlayer   *audioPlayer;  //播放器
@property (strong, nonatomic) LRCModel        *lrcModel;    //存储歌词信息
//@property (strong, nonatomic) NSTimer         *timer;       //添加计时器   使用计时器计时
@property (strong, nonatomic) CADisplayLink   *linkTimer;   //使用displaylink  计时


@property (strong, nonatomic) UIButton        *btnPlay;
@property (strong, nonatomic) UIButton        *btnStop;
@property (strong, nonatomic) UIImageView     *imageView;    //背景图片
@property (strong, nonatomic) UIImage         *playImage;
@property (strong, nonatomic) UIImage         *pauseImage;

@property (nonatomic) BOOL                    isPlay;        //显示歌曲播放的状态


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor    = [UIColor cyanColor];
    
    //初始化
    [self initAll];
    
    
}

//初始化控件和数据
- (void) initAll{
    
    //初始化按钮图片
    _playImage = [UIImage imageNamed:@"play.png"];
    _pauseImage = [UIImage imageNamed:@"pause.png"];
    
    //初始化歌词模型
    self.lrcModel = [LRCModel alloc];
    
    //初始化背景图片
    [self imageView];
    
    //读取歌词数据
    [self getLRC];
    
    //初始化play按钮
    [self btnPlay];
    [self btnStop];
    
    //初始化歌词显示label
    [self lrcTextLabel];
    
    //初始化歌曲播放器
    [self initMusic];
    
    //初始化计时器
//    self.timer = [[NSTimer alloc] init];
    self.linkTimer = [[CADisplayLink alloc] init];
    
    

    
}

#pragma mark: 添加背景图
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height - 80)];
        
        [_imageView setImage:[UIImage imageNamed:@"singer1.jpg"]];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.view addSubview:_imageView];
    }
    
    return _imageView;
}

   


//读取lrc
- (void)getLRC {
    
    //获取路径
    NSString *path        = [[NSBundle mainBundle] pathForResource:@"1sun" ofType:@"lrc"];

    self.lrcModel = [LRCModel LRCModelWithLrcPath:path];

}

#pragma mark: initMusic
- (void)initMusic {
    
    //获取歌曲url
    NSURL *url =  [NSURL fileURLWithPath:
                   [[NSBundle mainBundle]
                    pathForResource:@"Sun" ofType:@"mp3"]];
    
    //读取歌曲
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL: url error:nil];
    
    
    
}

#pragma mark set up text label
- (UILabel *)lrcTextLabel {
    if (!_lrcTextLabel) {
        _lrcTextLabel = [[UILabel alloc] initWithFrame:
                         CGRectMake(40, SCREEN_SIZE.height - 60, SCREEN_SIZE.width-80, 40)];
        
        _lrcTextLabel.font = [UIFont systemFontOfSize:25];
        _lrcTextLabel.textAlignment   = 1;
        _lrcTextLabel.backgroundColor = [UIColor blackColor];
        _lrcTextLabel.textColor       = [UIColor cyanColor];
        [_lrcTextLabel setText:@"偶阵雨——梁静茹"];
        
        [self.view addSubview:_lrcTextLabel];
    }
    
    return _lrcTextLabel;
}




#pragma mark set up button

//stop button
- (UIButton *)btnStop {
    if (!_btnStop) {
        
        _btnStop = [[UIButton alloc] initWithFrame:
                    CGRectMake(135, 500, 80, 40)];
        
        _btnStop.backgroundColor = [UIColor clearColor];
        _btnStop.center = CGPointMake(SCREEN_SIZE.width/2, SCREEN_SIZE.height-180);
        _btnStop.enabled = NO;
        
        _btnStop.titleLabel.font = [UIFont systemFontOfSize:30];

        //normal
        [_btnStop setTitle:@"STOP" forState:UIControlStateNormal];
        [_btnStop setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        
        //disabled
        [_btnStop setTitle:@"STOP" forState:UIControlStateDisabled];
        [_btnStop setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        
        _btnStop.backgroundColor = [UIColor clearColor];
        
        [_btnStop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btnStop];
    
    }
    
    return _btnStop;
}

//play button
- (UIButton *)btnPlay {
    if (!_btnPlay) {
        
        _btnPlay = [[UIButton alloc] initWithFrame:
                    CGRectMake(135, 500, 100, 80)];
        
        _btnPlay.backgroundColor = [UIColor clearColor];
        
        _btnPlay.center = CGPointMake(SCREEN_SIZE.width/2, SCREEN_SIZE.height-120);
        
        [_btnPlay setBackgroundImage:_playImage forState:UIControlStateNormal];
        
        _isPlay = YES;
        
        [_btnPlay addTarget:self action:@selector(playAndStop) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btnPlay];
        
    
        
    }
    
    return _btnPlay;
}

#pragma mark: 播放与暂停音乐
- (void) playAndStop {
    
    if (_isPlay) {
        
        //添加计时器
        [self startTimer];
        
        //播放
        [self.audioPlayer play];
        
        //改变播放暂停按钮属性
        [self setPlayButtonStateStop];
        
        //设置停止按钮可用
        self.btnStop.enabled = YES;
    } else {
        [self stopTimer];
        
        //设置停止按钮可用
        self.btnStop.enabled = YES;
        
        //暂停
        [self.audioPlayer pause];
        
        [self setPlayButtonStatePlay];
    }
}

#pragma mark: stop music

- (void)stop {
    
    self.btnStop.enabled = NO;
    
    [self.audioPlayer stop];
    self.audioPlayer.currentTime = 0;
    
    //改变play按钮属性
    [self setPlayButtonStatePlay];
    
    [self stopTimer];
    
    
}

#pragma mark 动态显示歌词
- (void)displaySondWord{
    NSUInteger time = self.audioPlayer.currentTime;

    for (int i = 0; i < self.lrcModel.timeArray.count; i++) {
        NSArray *timeArr = [self.lrcModel.timeArray[i] componentsSeparatedByString:@":"];
        
        NSUInteger currentTime = [timeArr[0] intValue] * 60 + [timeArr[1] intValue];
        
        if (i == self.lrcModel.timeArray.count - 1) {
            

            
            if (time > currentTime) {
                [self upDateTextView:i];
                break;
            }
        } else {
            //求出第一句歌词的时间点，在第一句歌词之前一直显示第一句歌词
            NSArray *timeArrStart = [self.lrcModel.timeArray[0] componentsSeparatedByString:@":"];
            
            NSUInteger timeStart = [timeArrStart[0] intValue] * 60 + [timeArrStart[1] intValue];
            
            if (time < timeStart) {
                [self upDateTextView:0];
                break;
            }
            NSArray *nextTimeArr = [self.lrcModel.timeArray[i+1] componentsSeparatedByString:@":"];
            
            NSUInteger nextTime = [nextTimeArr[0] intValue] * 60 + [nextTimeArr[1] intValue];
            
            if (time >= currentTime && time <= nextTime) {
                [self upDateTextView:i];
                break;
                
            }
        }
    }
    
    
}


#pragma mark 动态更新歌词表歌词
- (void)upDateTextView: (NSUInteger) lineNumber{
    
    self.lrcTextLabel.text = self.lrcModel.lrcDictionary[self.lrcModel.timeArray[lineNumber]];
    
}


#pragma mark: 添加和删除计时器
- (void)stopTimer {
    //NStimer
//    [self.timer invalidate];
//    self.timer = nil;
    
    
    //CADislink
    [self.linkTimer removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [self.linkTimer invalidate];
    
    self.linkTimer = nil;
    
}

- (void)startTimer {
    
    //cadisplaylink
    self.linkTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(displaySondWord)];
    [self.linkTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    //nstimer
//      self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(displaySondWord) userInfo:nil repeats:YES];
    
}



- (void)setPlayButtonStatePlay {
    //设置播放背景图
    [self.btnPlay setBackgroundImage:_playImage forState:UIControlStateNormal];
    
    //设置开始按钮可用
    self.isPlay = YES;
}


- (void)setPlayButtonStateStop {
    
    //设置暂停背景图片
    [self.btnPlay setBackgroundImage: _pauseImage forState:UIControlStateNormal];
    
    
    //设置暂停按钮可用
    self.isPlay = NO;
}













@end














