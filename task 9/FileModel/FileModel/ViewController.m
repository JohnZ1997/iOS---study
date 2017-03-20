//
//  ViewController.m
//  FileModel
//
//  Created by 张皓 on 16/6/7.
//  Copyright © 2016年 张皓. All rights reserved.
//

#import "ViewController.h"
#import "FileModel.h"
@interface ViewController ()
@property (strong, nonatomic)FileModel *model;
@property (strong, nonatomic)NSString  *strDoc;
@property (strong, nonatomic)NSString  *strDocFile;
@property (strong, nonatomic)NSString  *strDocFile2;
@property (strong, nonatomic)NSString *strDocArrayPath;
@property (strong, nonatomic)NSString *strDocDictPath;
@property (strong, nonatomic)NSString *strDocStringPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取沙盒中doc目录
    _strDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(_strDoc, nil);
    
    //初始化文件操作类
    _model = [FileModel initModel];
    
    _strDocFile = [_strDoc stringByAppendingString:@"/dict1"];
    _strDocFile2 = [_strDoc stringByAppendingString:@"/dict2"];
    
    _strDocDictPath = [_strDocFile stringByAppendingString:@"/file2.plist"];
    _strDocArrayPath = [_strDocFile stringByAppendingString:@"/file3.plist"];
    _strDocStringPath = [_strDocFile stringByAppendingString:@"/file4"];
    
    
    
    
    
}
- (IBAction)creatDict:(id)sender {
    //创建文件夹
    [_model addDictAtPath:@"/dict1" :_strDoc];
    [_model addDictAtPath:@"/dict2" :_strDoc];
    
}
- (IBAction)creatFile:(id)sender {
    
    //创建文件在当前文件夹
    [_model addFileAtPath:@"/file1.plist" :_strDocFile];
    
}
- (IBAction)writeDict:(id)sender {
    //将字典写入文件
    
    NSDictionary *dict = @{@"name":@"john", @"age":@"18"};
    [_model writeDictAtFilePath:dict :_strDocDictPath];

}
- (IBAction)writeArray:(id)sender {
    //将数组写入文件
    
    NSArray *arr = @[@"age", @"name"];
    [_model writeArrayAtFilePath:arr :_strDocArrayPath];
}
- (IBAction)writeString:(id)sender {
    //将字符串写入文件
    
    NSString *str = @"Hello";
    [_model writeStringAtFilePath:str :_strDocStringPath];
}
- (IBAction)readfile:(id)sender {
    //读文件
    
    
    //读取字典
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:_strDocDictPath];
    NSLog(@"读取字典");
    NSLog(@"%@", dict);
    
    //读取数组
    NSArray *arr = [NSArray arrayWithContentsOfFile:_strDocArrayPath];
    NSLog(@"读取数组");
    NSLog(@"%@", arr);
    
    //读取字符串
    NSString *str1 = [_model readStringAtPath:_strDocStringPath];
    NSLog(@"读取字符串");
    NSLog(str1, nil);
    
}
- (IBAction)getAllFile:(id)sender {
    NSArray *arr = [_model getAllFileAtPath:_strDocFile];
    
    NSLog(@"%@", arr);
}

- (IBAction)getFileSize:(id)sender {
    
    long long sizeOfDict   = [_model getFileSizeAtPath:_strDocDictPath];
    long long sizeOfArray  = [_model getFileSizeAtPath:_strDocArrayPath];
    long long sizeOfString = [_model getFileSizeAtPath:_strDocStringPath];
    
    NSLog(@"Dic: %lld", sizeOfDict);
    NSLog(@"Arr: %lld", sizeOfArray);
    NSLog(@"Str: %lld", sizeOfString);

    
}

- (IBAction)getFolderSize:(id)sender {
    float size;
    
    size = [_model getFolderSizeAtPath:_strDocFile];
    
    NSLog(@"%fM", size);
    
}

- (IBAction)deleteFile:(id)sender {
    [_model deleteFileAtPath:_strDocStringPath];
}

- (IBAction)moveFile:(id)sender {
    NSString *str = [_strDocFile2 stringByAppendingString:@"/new"];
    [_model moveFileFromPath:_strDocStringPath toPath:str];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
