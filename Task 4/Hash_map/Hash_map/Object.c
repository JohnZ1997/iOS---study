//
//  Object.c
//  Hash_map
//
//  Created by 张皓 on 4/17/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#include "Object.h"
#include <stdlib.h>

void ObjectRetain(Object *obj){
    obj->retainCount_ ++;
    printf("The object is retained\n");
}

void ObjectRelease(Object *obj){
    obj->retainCount_ --;
    if (obj->retainCount_ == 0) {
        free(obj);
        printf("The object is released\n");
    }
}
int ObjectReturnCount(Object *obj){
    return obj->retainCount_;
}



