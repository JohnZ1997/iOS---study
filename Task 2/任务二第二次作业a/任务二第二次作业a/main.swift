//
//  main.swift
//  任务二第二次作业
//
//  Created by 张皓 on 16/4/7.
//  Copyright © 2016年 张皓. All rights reserved.
//

import Foundation

struct Student {
    var name :String
    var Math :Int
    var English : Int
    func average() -> Double{
        return Double(Math+English)
    }
}
var s = [
    Student(name: "John0", Math: 11, English: 11),
    Student(name: "John1", Math: 88, English: 88),
    Student(name: "John2", Math: 33, English: 33),
    Student(name: "John3", Math: 77, English: 77),
    Student(name: "John4", Math: 55, English: 55),
    Student(name: "John5", Math: 66, English: 66),
    Student(name: "John6", Math: 44, English: 44),
    Student(name: "John7", Math: 22, English: 22),
    Student(name: "John8", Math: 99, English: 99),
    Student(name: "John9", Math: 10, English: 10)]
func sort(var Array : [Student]) -> [Student] {
    var a : Student = Array[0]
    for t in 0...9{
        for i in t...9{
            if Array[i].average() < Array[t].average(){
                a = Array[t]
                Array[t] = Array[i]
                Array[i] = a
            }
        }
    }
    return Array
}
s = sort(s)
for i in 0...9{
    print("\(s[i].name)的平均分是：\(s[i].average()), 数学：\(s[i].Math), 英语：\(s[i].English)")
}
