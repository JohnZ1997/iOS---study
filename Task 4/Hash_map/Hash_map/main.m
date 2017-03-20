//
//  main.m
//  Hash_map
//
//  Created by 张皓 on 4/18/16.
//  Copyright © 2016 张皓. All rights reserved.
//


#import <Foundation/Foundation.h>
#include "Hash_map.h"
#include "Object.h"
#include "people.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        HashMap *map ;
        map =HashMapCreate();
        printf("retaincount:%d\n",ObjectReturnCount((AnyPoint)map));
        hash_map_put(map, "John1", (AnyPoint)peopleNew("xiaowang", 23));
        printf("retaincount:%d\n",ObjectReturnCount((AnyPoint)map));
        hash_map_put(map, "John2",(AnyPoint)peopleNew("xiaoli", 13));
        printf("retaincount:%d\n",ObjectReturnCount((AnyPoint)map));
        printf("key为John1的对象中年龄为：%d\n",((people*)hash_map_get(map, "John1"))->age_);
        hash_map_remove(map, "John1");
        if ((people*)hash_map_get(map, "John1")) {
            printf("key为John1的对象中年龄为：%d\n",((people*)hash_map_get(map, "John1"))->age_);
        }
        else{
            printf("数据不存在\n");
        }
        
        printf("retaincount:%d\n",ObjectReturnCount((AnyPoint)map));
        
        
        HashMapDestory(map);
        
    }
    return 0;
}
