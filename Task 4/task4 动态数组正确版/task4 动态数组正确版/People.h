//
//  People.h
//  task4 动态数组正确版
//
//  Created by 张皓 on 4/15/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#ifndef People_h
#define People_h



#include <stdio.h>
#include <stdlib.h>
#include "Object.h"

typedef struct People_{
    int retainCount_;
    char *name_;
    int age_;
}People;


People *PeopleNew(char *name, int age);
char *PeopleGetName(People *one);
int PeopleGetAge(People *one);

#endif /* People_h */
