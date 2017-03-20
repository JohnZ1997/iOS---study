//
//  Object.h
//  Hash_map
//
//  Created by 张皓 on 4/17/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#ifndef Object_h
#define Object_h

#include <stdio.h>

typedef struct Object_{
    int retainCount_;
    
}Object;

void ObjectRetain(Object *obj);
void ObjectRelease(Object *obj);
int ObjectReturnCount(Object *obj);
#endif /* Object_h */



