//
//  singerModel.h
//  test1_singersbrowser
//
//  Created by 张皓 on 4/24/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singerModel : NSObject
//singer name
@property(nonatomic, strong) NSString * name;

//singer song
@property(nonatomic, strong) NSString * song;

//singer picture
@property(nonatomic, strong) NSString * pic;

- (instancetype)initWithDict: (NSDictionary *)dict;

+ (instancetype)singerModelWithDict: (NSDictionary *)dict;



@end
