//
//  ViewController.swift
//  scrollView
//
//  Created by 张皓 on 16/5/16.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var showBanner:Banner!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //初始化
        showBanner = Banner.init(frame: CGRectMake(0, 0,
            UIScreen.mainScreen().bounds.width,
            UIScreen.mainScreen().bounds.height-200))
        showBanner.changeBannerImages()
        self.view.addSubview(showBanner)

        
        showBanner.scrollDuration = 2
        showBanner.changeBannerImages()
//        showBanner.setBannerImages(["2.jpg"])
        
        
        self.view.backgroundColor = UIColor.blackColor()

        
    }
    
}


