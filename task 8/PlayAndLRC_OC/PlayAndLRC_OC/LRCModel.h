//
//  LRCModel.h
//  PlayAndLRC_OC
//
//  Created by 张皓 on 16/5/23.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRCModel : NSObject

@property (strong, nonatomic) NSMutableArray   *timeArray;

@property (strong, nonatomic) NSMutableDictionary *lrcDictionary;

+ (instancetype) LRCModelWithLrcPath :(NSString *) lrc;

@end
