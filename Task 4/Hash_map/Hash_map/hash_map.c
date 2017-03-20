//
//  hash_map.c
//  Hash_map
//
//  Created by 张皓 on 4/17/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#include "Hash_map.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>

//获取key元素位置
static int getIndexByValue(HashMap *map ,char *key){
    int index =-1;
    for(int i =0;i<map->length_;i++){
        if(*key == map->keys_[i]){
            index = i;
            break;
        }
    }
    return index;
}
//创建
HashMap *HashMapCreate(){
    HashMap *hashMap = malloc(sizeof(HashMap));
    hashMap->length_ = 0;
    hashMap->capacity_ =32;
    hashMap->values_ =malloc(sizeof(AnyPoint)*hashMap->capacity_);
    hashMap->keys_ =malloc(sizeof(char*)*hashMap->capacity_);
    return hashMap;
}

//获取数组的长度
int HashMapGetLength(HashMap *hashMap){
    return hashMap->length_;
}

void hash_map_put(HashMap *map , char* key , AnyPoint value){
    if(getIndexByValue(map, key)!= -1){
        printf("\n当前字典中，已经存在该key%s",key);
    }else{
        if(map->length_>=map->capacity_){
            map->capacity_ *= 2;
            AnyPoint *oldValues =map->values_;
            map->values_ =malloc(sizeof(AnyPoint)*map->capacity_);
            memcpy(map->values_, oldValues, map->length_*sizeof(AnyPoint));
            free(oldValues);
            
            char *oldkeys =map->keys_;
            map->keys_ =malloc(sizeof(char *)*map->capacity_);
            memcpy(map->keys_, oldkeys, map->length_*sizeof(char*));
            free(oldkeys);
        }
        map->values_[map->length_] = value;
        map->keys_[map->length_]=*key;
        map->length_ ++;
        ObjectRetain(value);
        printf("key值为%s的对象插入成功\n",key);
    }
}

//根据key获取对象
AnyPoint hash_map_get(HashMap *map ,char *key){
    int index =getIndexByValue(map, key);
    if(index == -1){
        printf("没有key为%s的对象\n",key);
        
    }
    return map->values_[index];
}

//移除指定key的对象

void hash_map_remove(HashMap *map , char *key){
    int index = getIndexByValue(map, key);
    if(index!=-1){
        assert(index>= 0 && index <map->length_);
        ObjectRelease(map->values_[index]);
        map->length_--;
        for (int i =index; i<HashMapGetLength(map); i++) {
            map->values_[i] =map->values_[i+1];
            map->keys_[i]=map->keys_[i+1];
            
        }
        printf("key值为%s的对象移除成功\n",key);
        
    }else{
        printf("没有key值为%s的对象\n",key);
        
    }
}
//销毁
void HashMapDestory(HashMap *map){
    free(map->values_);
    free(map->keys_);
    free(map);
    printf("hashmap is destoryed\n");
}



