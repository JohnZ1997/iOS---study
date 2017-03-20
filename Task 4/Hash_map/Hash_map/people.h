//
//  people.h
//  Hash_map
//
//  Created by 张皓 on 4/17/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#ifndef people_h
#define people_h

#include <stdio.h>
#include "Object.h"

typedef struct people_{
    int RetainCount;
    char* name_;
    int age_;
}people;

people * peopleNew(char* name, int age);


#endif /* people_h */
