//
//  girlfriend.swift
//  任务三第一次作业100个女朋友
//
//  Created by 张皓 on 16/4/10.
//  Copyright © 2016年 张皓. All rights reserved.
//

import Foundation

public class girlFriend {
    public var _name : String
    public var _age : Int
    init(age :Int, name: String){
        _age = age
        _name = name
    }
    public var age: Int {
        get {
            return _age
        }
    }
    public var name: String {
        get {
            return _name
        }
    }
}
