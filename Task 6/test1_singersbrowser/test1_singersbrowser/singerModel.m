//
//  singerModel.m
//  test1_singersbrowser
//
//  Created by 张皓 on 4/24/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import "singerModel.h"

@implementation singerModel

- (instancetype)initWithDict: (NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)singerModelWithDict: (NSDictionary *)dict{
    return [[singerModel alloc] initWithDict:dict];
}


@end
