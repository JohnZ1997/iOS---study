//
//  main.m
//  任务四第一次作业，单项链表逆序
//
//  Created by 张皓 on 4/11/16.
//  Copyright © 2016 张皓. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct _Node{
    int value;
    struct _Node *next;
}Node;

Node *creatNode(int value, Node *next) {
    Node *node = malloc(sizeof(Node));
    node -> value = value;
    node -> next = next;
    return node;
}

void printList(Node *first){
    for (Node *node = first; node != NULL; node = node -> next) {
        printf("%d\n",node -> value);
    }
}

Node *reversalList(Node *first){
    Node *p1 = first;
    Node *p2 = first -> next;
    Node *p3 = NULL;
    first -> next = NULL;
    while (p2 != NULL) {
        p3 = p2 ;
        p2 = p2 -> next;
        p3 -> next = p1;
        p1 = p3;
    }
    first = p1;
    
    return first;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Node *current = creatNode(0, NULL);
        Node *first = current;
        for (int i=1; i<10; i++) {
            current -> next = creatNode(i, NULL);
            current = current -> next;
        }
        
        
        printList(first);
        printf("converse\n");
        
        printList(reversalList(first));
    }
    return 0;
}
