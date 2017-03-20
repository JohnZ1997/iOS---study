//
//  DrawingBoard.swift
//  DrawingBoardNew
//
//  Created by  on 5/4/16.
//  Copyright © 2016 . All rights reserved.
//
import Foundation
import UIKit

class DrawingBoard: UIView {
    
    var path : CGMutablePath
    var linewidth : CGFloat

    required init?(coder aDecoder: NSCoder) {
        linewidth = 0
        path = CGPathCreateMutable()
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        //设置线的属性
        CGContextSetLineWidth(context, linewidth)
        //draw
        CGContextAddPath(context, path)
        CGContextStrokePath(context)
    }

    //记录path
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let location = touches.first?.locationInView(self)
        
        CGPathMoveToPoint(path, nil, (location?.x)!, (location?.y)!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let location = touches.first?.locationInView(self)
        
        CGPathAddLineToPoint(path, nil, (location?.x)!, (location?.y)!)
        setNeedsDisplay()
    }
    
    //清空画板
    func clearDrawingBorad() {
        path = CGPathCreateMutable()
        self.setNeedsDisplay()
    }
    
}
