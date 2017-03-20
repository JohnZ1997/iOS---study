//
//  BannerVIew.h
//  scrollView123
//
//  Created by 张皓 on 16/5/15.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerVIew : UIView

- (instancetype)initWithTimerAndImgs:(NSNumber *)timer imgs:(NSArray *)imgs;

- (void)resetTimer:(NSNumber *)interval;

- (void)addImageTOScroll:(UIImage *)newImage;

@end
