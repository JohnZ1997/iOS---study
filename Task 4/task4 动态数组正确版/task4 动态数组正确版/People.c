//
//  People.c
//  task4 动态数组正确版
//
//  Created by 张皓 on 4/15/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#include "People.h"


//创建新对象
People *PeopleNew(char *name, int age){
    People *one = malloc(sizeof(People));
    OBJECT_RETAIN(one);
    one->name_ = name;
    one->age_ = age;
    return one;
}

//获取people对象
char *PeopleGetName(People *one){
    return one->name_;
}
int PeopleGetAge(People *one){
    return one->age_;
}





