//
//  main.m
//  Task4 －C－DynamicArray
//
//  Created by 张皓 on 4/14/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Array.h"
#import "Object.h"
#import "People.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Array *arr = ArrayCreate();
        AnyPointer  people;
        
        people = (Object*)PeopleNew("John1", 20);
        ArrayAddAtIndex(arr, people, 0);
        OBJECT_RELEASE(people);
        
        people = (Object*)PeopleNew("John2", 15);
        ArrayAddAtIndex(arr, people, 1);
        OBJECT_RELEASE(people);
        
        
        people = (Object*)PeopleNew("John3", 17);
        ArrayAddAtIndex(arr, people, 2);
        OBJECT_RELEASE(people);
        
        people = (Object*)PeopleNew("John4", 19);
        ArrayAddAtIndex(arr, people, 3);
        OBJECT_RELEASE(people);
        

//修改
        people = (Object*)PeopleNew("John1", 20);
        ArrayAlter(arr, people, 2);
        OBJECT_RELEASE(people);

//输出
        for (int i=0; i<arr->length_; i++) {
            printf("index: %d\t", i);
            printf("name: %s\t\t", ((People*)ArrayGet(arr, i))->name_);
            printf("age: %d\n",((People*)ArrayGet(arr, i))->age_);
        }
        
        ArrayRemoveAtIndex(arr, 1);//删除
        
        
       
//输出
        for (int i=0; i<arr->length_; i++) {
            printf("index: %d\t", i);
            printf("name: %s\t\t", ((People*)ArrayGet(arr, i))->name_);
            printf("age: %d\n",((People*)ArrayGet(arr, i))->age_);
        }
        
//当前长度获取
        printf("length:   %d\n",ArrayGetLength(arr));
        
//添加
        people =  (Object*)PeopleNew("John5", 20);
        ArrayAddAtIndex(arr, people, 1);
        
        
//输出
        for (int i=0; i<arr->length_; i++) {
            printf("index: %d\t", i);
            printf("name: %s\t\t", ((People*)ArrayGet(arr, i))->name_);
            printf("age: %d\n",((People*)ArrayGet(arr, i))->age_);
        }
        
//查找
        int j = 2;
        printf("Who is the %d people \n", j);
        printf("He is %s, %d years old\n", ((People*)ArrayGet(arr, j-1))->name_, ((People*)ArrayGet(arr, j-1))->age_);
        
//销毁
        ArrayDestoryed(arr);
        
        
    }
    return 0;
}
