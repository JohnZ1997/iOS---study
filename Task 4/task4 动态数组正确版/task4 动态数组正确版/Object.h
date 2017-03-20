//
//  Object.h
//  Task4 －C－DynamicArray
//
//  Created by 张皓 on 4/14/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#ifndef Object_h
#define Object_h

#include <stdio.h>

typedef struct Object_{
    int retainCount_ ;
} Object;

#define OBJECT_RETAIN(obj) ObjectRetain((Object*) obj)
#define OBJECT_RELEASE(obj) ObjectRelease((Object*) obj)
#define OBJECT_RETAIN_RETAINCOUNT ObjectRetainRetainCount((Object*) obj)

void ObjectRetain(Object* obj);
void ObjectRelease(Object* obj);
int ObjectRetainRetainCount(Object* obj);



#endif /* Object_h */
