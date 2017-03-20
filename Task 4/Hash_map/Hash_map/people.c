//
//  people.c
//  Hash_map
//
//  Created by 张皓 on 4/17/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#include "people.h"
#include <stdlib.h>
#include "Object.h"


people * peopleNew(char* name, int age){
    people * people = malloc(sizeof(people));
    ObjectRetain((Object *) people);
    people->age_ = age;
    people->name_ = name;
    return people;
}



