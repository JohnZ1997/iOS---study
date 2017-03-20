//
//  ViewController.swift
//  scrollviewd动态改变图片
//
//  Created by 张皓 on 16/5/18.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var banner: Banner!
    var auto: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner = Banner(frame: self.view.frame)
        self.view.addSubview(banner)
        
        //控制是否自动轮播及是否添加pagecontrol，
//        auto = false
//        if auto! {
//            banner.pageControlEnabled = false
//            banner.autoScroll = false
//        }
        
        

        banner.setBannerImages(["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg"])
        banner.autoScrollTimeInterval = 5

        
        
        
        
      
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

