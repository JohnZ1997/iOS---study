//
//  FileModel.h
//  FileModel
//
//  Created by 张皓 on 16/6/7.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileModel : NSObject

+ (instancetype)initModel;

- (BOOL)addDictAtPath:(NSString *)name :(NSString *)path;
- (BOOL)addFileAtPath:(NSString *)name :(NSString *)path;

- (BOOL)writeDictAtFilePath:(NSObject *)dict :(NSString *)path;
- (BOOL)writeArrayAtFilePath:(NSArray *)array :(NSString *)path;
- (BOOL)writeStringAtFilePath:(NSString *)string :(NSString *)path;

- (NSDictionary *)readDictAtPath:(NSString *)path;
- (NSArray *)readArrayAtPath:(NSString *)path;
- (NSString *)readStringAtPath:(NSString *)path;
- (NSArray *)getAllFileAtPath:(NSString *)path;

- (long long) getFileSizeAtPath:(NSString *)path;
- (float)getFolderSizeAtPath:(NSString*) folderPath;

- (BOOL)deleteFileAtPath:(NSString *)path;

- (BOOL)moveFileFromPath:(NSString *)path toPath:(NSString *)toPath;

@end
