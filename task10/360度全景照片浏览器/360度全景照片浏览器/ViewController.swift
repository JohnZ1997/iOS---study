//
//  ViewController.swift
//  360度全景照片浏览器
//
//  Created by 张皓 on 16/7/12.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController, UIScrollViewDelegate {
    

    lazy var NSOptQueue: NSOperationQueue = {
        var queue = NSOperationQueue()
        return queue
    }()
    
    lazy var cmmManager: CMMotionManager = {
        var cmm = CMMotionManager()
        return cmm
    }()
    
    
    func startGyroUpdate(){
        cmmManager.gyroUpdateInterval = 0.1
        
        if cmmManager.gyroAvailable {
            cmmManager.startGyroUpdatesToQueue(NSOptQueue, withHandler: { (data:CMGyroData?, error: NSError? ) in
                
                //获取陀螺仪y方向的值的变化
                let x = CGFloat((data?.rotationRate.x)! * 70)
                
                //消除抖动
                if abs(x) < 10 {
                    return
                }
                
                //计算scroll的新的contentset
                var newY = self.scroll.contentOffset.y + CGFloat(x)
                
                //实现循环浏览   //设置scrollview的contentset
                if newY < 10 {
                    
                    newY = self.scroll.contentSize.height * 1.0 / 3.0
                    self.scroll.setContentOffset(CGPointMake(0, newY - 10), animated: false)
                    
                    
                } else if newY > (self.scroll.contentSize.height * 2 / 3 - 10) {
                    
                    newY = self.scroll.contentSize.height * 1.0 / 3.0
                    self.scroll.setContentOffset(CGPointMake(0, newY + 10), animated: false)
                    
                } else {
                    self.scroll.setContentOffset(CGPoint(x: 0, y: newY), animated: true)
                }

                
                print(newY)

                
            
            })
            
            
        }
        
        
    }
    
    private var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取屏幕的大小
        let rectSize = self.view.bounds.size

        
        //初始化scrollview
        scroll = UIScrollView.init(frame: self.view.frame)
        scroll.bounces = false
        scroll.contentSize = CGSize(width: rectSize.width, height: rectSize.width / 512 * 1024 * 3)
        scroll.userInteractionEnabled = false
        scroll.delegate = self
        scroll.scrollEnabled = true
        scroll.backgroundColor = UIColor.whiteColor()

        self.view.addSubview(scroll);
        

        
    
        //设置显示的图片
        let img = UIImage.init(named: "360.jpg")
        let imgViewHeight = rectSize.width / 512 * 1024
        
        for i in 0..<3 {
            
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: CGFloat(i) * imgViewHeight, width: rectSize.width, height: imgViewHeight))
            imageView.image = img
            
            scroll.addSubview(imageView)
        }
        
        scroll.setContentOffset(CGPointMake(0, self.scroll.contentSize.height / 3), animated: true)
        
        startGyroUpdate()
    }
    
    



}



