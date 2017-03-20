//
//  MainController.swift
//  DrawingBoardNew
//
//  Created by  on 5/5/16.
//  Copyright © 2016 . All rights reserved.
//

import UIKit
import QuartzCore

class MainController: UIViewController {
    

    @IBOutlet weak var titleLabel: UILabel!


    @IBOutlet weak var Board: DrawingBoard!
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerComponents()
        upDateLineWidth(widthSlider)
    }
    //添加响应事件
    func registerComponents(){
        
        clearBtn.addTarget(self, action: "clearBoard", forControlEvents: UIControlEvents.TouchUpInside)
        
        saveBtn.addTarget(self, action: "saveImage", forControlEvents: UIControlEvents.TouchUpInside)
        
        widthSlider.addTarget(self, action: "upDateLineWidth:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //清空绘图板
    func clearBoard(){
        print("clear pressed")
        Board.clearDrawingBorad()
        Board.setNeedsDisplay()
    }
    
    //保存图片
    func saveImage(){
        UIGraphicsBeginImageContext(Board.bounds.size)
        Board.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let boardImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIImageWriteToSavedPhotosAlbum(boardImage, nil, nil, nil)
        print("picture saved")
        
        //保存提示
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.titleLabel.text = "FINISHED";
        self.titleLabel.backgroundColor = UIColor.grayColor();
        self.titleLabel.alpha = 0.8;
        self.titleLabel.textAlignment = NSTextAlignment.Center;
        self.view.addSubview(self.titleLabel)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.titleLabel.alpha = 0;
            }) { (Bool) -> Void in
                
        }
        
        
    }
    
    //调整线宽
    func upDateLineWidth(slider: UISlider){
        Board.linewidth = CGFloat.init(3 + slider.value * 8)
        Board.setNeedsDisplay()
    }
    

}
