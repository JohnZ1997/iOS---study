//
//  Array.h
//  Task4 －C－DynamicArray
//
//  Created by 张皓 on 4/14/16.
//  Copyright © 2016 张皓. All rights reserved.
//
//增删改查


#ifndef Array_h
#define Array_h

#include <stdio.h>
#include "Object.h"


typedef Object * AnyPointer;

typedef struct Array_{
    int retainCount_;
    int length_;
    int capacity_;
    AnyPointer * peoples_;
}Array;

Array * ArrayCreate();
int ArrayGetLength(Array *arr);
void ArrayAddAtIndex(Array *arr, AnyPointer people, int index);
AnyPointer ArrayGet(Array *arr, int index);
void ArrayRemoveAtIndex(Array *arr, int index);
void ArrayAlter(Array *arr, AnyPointer newPeople,  int index);
void ArrayDestoryed(Array *arr);





#endif /* Array_h */
