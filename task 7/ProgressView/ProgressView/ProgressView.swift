//
//  ProgressView.swift
//  ProgressView
//
//  Created by 张皓 on 16/5/10.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    
    var progress:CGFloat = 0.2{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var centerX: CGFloat{
        return self.frame.width / 2
    }
    
    var centerY: CGFloat{
        return self.frame.height / 2
    }
    
    var radius: CGFloat{
        return self.frame.width / 4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        //绘制扇形区域
        CGContextSetRGBFillColor(context, 0, 0, 0, 0.3)
        CGContextAddArc(context, centerX, centerY, radius, CGFloat(-M_PI_2), CGFloat(M_PI*2)*progress - CGFloat(M_PI_2), 1)
        
        CGContextAddLineToPoint(context, centerX, centerY)
        CGContextFillPath(context)
        
        //绘制外围的填充
        let x = centerX - (radius+10)
        let y = centerY - (radius+10)
        
        let width = (radius+10) * 2
        let height = width
        
        let ellipseRect = CGRect(x: x, y: y, width: width, height: height)
        CGContextAddEllipseInRect(context, ellipseRect)
        
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, 0, self.frame.height)
        CGContextAddLineToPoint(context, self.frame.width, self.frame.height)
        CGContextAddLineToPoint(context, self.frame.width, 0)
        CGContextAddLineToPoint(context, 0, 0)
        CGContextFillPath(context)
        
    }
    

}
