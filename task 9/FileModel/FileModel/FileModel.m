//
//  FileModel.m
//  FileModel
//
//  Created by 张皓 on 16/6/7.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import "FileModel.h"
@interface FileModel()

@property (copy, nonatomic)    NSString *path;
@property (strong, nonatomic)  NSFileManager *manager;

@end

@implementation FileModel

+ (instancetype)initModel{
    
    
    
    return [[FileModel alloc] initManager];
}

- (instancetype)initManager {
    self = [super init];
    
    //全局变量存储路径
    
    _manager = [NSFileManager defaultManager];
    
    return self;
    
}

//创建文件夹
- (BOOL)addDictAtPath:(NSString *)name :(NSString *)path{
    path = [path stringByAppendingString:name];
    
    return [_manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    
}

//创建文件
- (BOOL)addFileAtPath:(NSString *)name :(NSString *)path{
    path = [path stringByAppendingString:name];
    
    
    return [_manager createFileAtPath:path contents:nil attributes:nil];
    
}

//写文件
- (BOOL)writeDictAtFilePath:(NSDictionary *)dict :(NSString *)path {
    BOOL bExist = [_manager fileExistsAtPath:path];
    
    // 判断文件是否存在
    if (!bExist) {
        return [dict writeToFile:path atomically:YES];
        
    }
    return NO;
    
    
}

- (BOOL)writeArrayAtFilePath:(NSArray *)array :(NSString *)path {
    BOOL bExist = [_manager fileExistsAtPath:path];
    
    //判断文件是否存在
    if (!bExist) {
        return [array writeToFile:path atomically:YES];
        
    }
    return NO;
}

- (BOOL)writeStringAtFilePath:(NSString *)string :(NSString *)path {
    BOOL bExist = [_manager fileExistsAtPath:path];
    
    //判断文件是否存在
    if (!bExist) {
        return [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
    }
    return NO;
}

//读文件
- (NSDictionary *)readDictAtPath:(NSString *)path {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    return dict;
    
}

- (NSArray *)readArrayAtPath:(NSString *)path {
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    return arr;
}

- (NSString *)readStringAtPath:(NSString *)path {
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return str;
}

//获取一个目录下的所有文件
- (NSArray *)getAllFileAtPath:(NSString *)path {
    
    NSArray *arrOfFile = [[NSArray alloc] init];
    
    arrOfFile = [_manager contentsOfDirectoryAtPath:path error:nil];
    
    
    return arrOfFile;
}

- (long long)getFileSizeAtPath:(NSString *)path {
    BOOL bExist = [_manager fileExistsAtPath:path];
    
    if (bExist) {
        return [[_manager attributesOfItemAtPath:path error:nil] fileSize];
    }
    return 0;

}

- (float)getFolderSizeAtPath:(NSString*) folderPath {
    BOOL bExist = [_manager fileExistsAtPath:folderPath];
    
    if (!bExist) return 0;
    NSEnumerator *childFilesEnumerator = [[_manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self getFileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

-(BOOL)deleteFileAtPath:(NSString *)path {
    
    return [_manager removeItemAtPath:path error:nil];
    
}

- (BOOL)moveFileFromPath:(NSString *)path toPath:(NSString *)toPath {
    
    return [_manager copyItemAtPath:path toPath:toPath error:nil];
    
}








@end
