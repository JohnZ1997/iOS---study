//
//  split.swift
//  任务三第二次作业.split功能
//
//  Created by 张皓 on 16/4/9.
//  Copyright © 2016年 张皓. All rights reserved
//

import Foundation

extension NSString {
    func split(sValue: String) -> [String]{
        var arr = [String]()
        var str0 : String = ""
        var itself = self
        while (itself.rangeOfString(sValue).toRange() != nil) {
            let subRange = itself.rangeOfString(sValue)
            str0 = itself.substringToIndex(subRange.location)
            arr.append(str0)
            itself = itself.substringFromIndex(subRange.location + subRange.length)
        }
        if itself != ""{
            arr.append(itself as String)
        }
        return arr
}
}
//extension NSString {
//    func split1 (sValue: String) -> [NSString]{
//        var arr: [NSString] = []
//        var str: NSString = self
//        while (str.rangeOfString(sValue).toRange() != nil) {
//            let subRange = str.rangeOfString(sValue)
//            let subStr = str.substringToIndex(subRange.location)
//            arr.append(subStr)
//            str = str.substringFromIndex(subRange.location + subRange.length)
//        }
//        if str != ""{
//            arr.append(str)
//        }
//        return arr
//    }
//}
//
