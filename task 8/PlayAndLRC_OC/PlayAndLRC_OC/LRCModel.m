//
//  LRCModel.m
//  PlayAndLRC_OC
//
//  Created by 张皓 on 16/5/23.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import "LRCModel.h"

@interface LRCModel()



@end

@implementation LRCModel

+ (instancetype)LRCModelWithLrcPath:(NSString *)lrc{
    
    
    
    LRCModel *model = [LRCModel alloc];
    
    model.timeArray = [[NSMutableArray alloc] initWithCapacity:10];
//    model.lrcArray = [[NSMutableArray alloc] initWithCapacity:10];
    model.lrcDictionary = [[NSMutableDictionary alloc] initWithCapacity:10];
        
    
        //读取文件
        NSString *contentStr  = [NSString stringWithContentsOfFile:lrc encoding:NSUTF8StringEncoding error:nil];
        
        //分割每行存储在数组里
        NSArray *contentArray = [contentStr componentsSeparatedByString:@"\n"];
        
        
        //循环遍历数组元素将时间和歌词以键对方式存储在字典里
        for (int i = 0; i < [contentArray count]; i++) {
            NSString *lineStr  = [contentArray objectAtIndex:i];
            NSArray  *lineArr  = [lineStr componentsSeparatedByString:@"]"];
            
            //判断数据格式是否正确，不正确则跳过本行
            if ([lineArr[0] length] > 8) {
                NSString *str1 = [lineStr substringWithRange:NSMakeRange(3, 1)];
                NSString *str2 = [lineStr substringWithRange:NSMakeRange(6, 1)];
                
                //确定格式
                if ([str1 isEqualToString:@":"] && [str2 isEqualToString:@"."]) {
                    
                    NSString *lrcStr  = [lineArr objectAtIndex:1];
                    NSString *timestr = [[lineArr objectAtIndex:0]
                                         substringWithRange:NSMakeRange(1, 5)];
                    
                    [model.timeArray addObject:timestr];
//                    [model.lrcArray addObject:lrcStr];
                    [model.lrcDictionary setObject:lrcStr forKey:timestr];
                    
                }
            }
        }
    

    
    return model;
}


@end
