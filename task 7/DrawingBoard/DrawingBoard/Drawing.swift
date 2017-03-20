//
//  Drawing.swift
//  DrawingBoard
//
//  Created by 张皓 on 5/4/16.
//  Copyright © 2016 张皓. All rights reserved.
//
import UIKit

class DrawingBoard: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    var path = CGPathCreateMutable()
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let p = touches.first?.locationInView(self)
        CGPathMoveToPoint(path, nil, p!.x, p!.y)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let p = touches.first?.locationInView(self)
        CGPathMoveToPoint(path, nil, p!.x, p!.y)
        
        setNeedsDisplay()
    }
    
    
    
    
    
    
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        CGContextAddPath(context, path)
        CGContextStrokePath(context)
    }
    
    
}



