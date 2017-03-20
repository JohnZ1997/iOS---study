//
//  Array.c
//  Task4 －C－DynamicArray
//
//  Created by 张皓 on 4/14/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#include "Array.h"


#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include "Object.h"

static AnyPointer * allocMemoryByCapacity(Array *arr){
    return malloc(sizeof(AnyPointer) * arr->capacity_);
}

//创建
Array * ArrayCreate(){
    Array* arr = malloc(sizeof(Array));
    arr->length_ = 0;
    arr->capacity_ = 32;
    arr->peoples_ = allocMemoryByCapacity(arr);
    
    return arr;
}

//获取当前位置
int ArrayGetLength(Array *arr){
    return arr->length_;
}

// 插入元素
void ArrayAddAtIndex(Array *arr, AnyPointer people, int index){
    assert(index>=0 && index<=arr->length_);//断言
    if (arr->length_ >= arr->capacity_) {
        AnyPointer *oldPeople = arr->peoples_;
        
        arr->capacity_*=2;
        arr->peoples_ = allocMemoryByCapacity(arr);
        memcpy(arr->peoples_, oldPeople, arr->length_);
        
        free(oldPeople);
    }
    
    if (index == arr->length_) {
        arr->peoples_[arr->length_] = people;
    }
    else {
        for (int i = arr->length_; i>index; i--) {
            arr->peoples_[i] = arr->peoples_[i-1];
        }
        arr->peoples_[index] = people;
    }
    arr->length_ ++;
    ObjectRetain(people);
}


//获取数组元素
AnyPointer ArrayGet(Array *arr, int index){
    assert(index>=0 && index<arr->length_);
    return  arr->peoples_[index];
}



//删除指定位置元素
void ArrayRemoveAtIndex(Array *arr, int index){
    assert(index>=0 && index<arr->length_);
    
    OBJECT_RELEASE(ArrayGet(arr, index));
    arr->length_ --;
    for (int i=index; i<arr->length_; i++) {
        arr->peoples_[i] = arr->peoples_[i+1];
    }
}


//修改指定位置的元素
void ArrayAlter(Array *arr, AnyPointer newPeople, int index){
    arr->peoples_[index] = newPeople;
    OBJECT_RETAIN(newPeople);
}

//销毁
void ArrayDestoryed(Array *arr){
    free(arr->peoples_);
    free(arr);
    printf("Array is destoryed\n");
}




