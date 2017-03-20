//
//  hash_map.h
//  Hash_map
//
//  Created by 张皓 on 4/17/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#ifndef Hash_map_h
#define Hash_map_h
#include "Object.h"
#include <stdio.h>
typedef  Object* AnyPoint;
typedef struct Hash_map_{
    
    
    int length_;
    int capacity_;
    char* keys_;
    AnyPoint *values_;
}HashMap;

HashMap *HashMapCreate();
int HashMapGetLength(HashMap *hashMap);
AnyPoint hash_map_get(HashMap *map ,char *key);
void hash_map_put(HashMap *map , char* key , AnyPoint value);
void hash_map_remove(HashMap *map , char *key);
void HashMapDestory(HashMap *map);
#endif /* Hash_map_h */
