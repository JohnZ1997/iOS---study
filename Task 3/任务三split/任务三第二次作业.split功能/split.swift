//
//  split.swift
//  任务三第二次作业.split功能
//
//  Created by 张皓 on 16/4/9.
//  Copyright © 2016年 张皓. All rights reserved.
//

import Foundation

extension NSString {
    func split(sValue: Character) {

        var str0 : String = ""
        let itself = String(self)
        for item in  itself.characters{
            switch item{
            case sValue:
                print(str0)
                str0.removeAll()
            default:
                str0.append(item)
            }
        }
        print(str0)
    }
}


