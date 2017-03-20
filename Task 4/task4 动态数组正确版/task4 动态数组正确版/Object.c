//
//  Object.c
//  Task4 －C－DynamicArray
//
//  Created by 张皓 on 4/14/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#include "Object.h"
#include <stdlib.h>
//引用计数自增
void ObjectRetain(Object* obj){
    obj->retainCount_ ++;
}

//引用计数自减
void ObjectRelease(Object* obj){
    obj->retainCount_ --;
    if (obj->retainCount_ == 0) {
        free(obj);
        printf("The object is released\n");
    }
}

//获取引用计数
int ObjectRetainRetainCount(Object* obj){
    return obj->retainCount_;
}
