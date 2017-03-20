//
//  BaseBrush.swift
//  task7_test1_simple_drawingBoard
//
//  Created by 张皓 on 5/4/16.
//  Copyright © 2016 张皓. All rights reserved.
//

import CoreGraphics

protocol PaintBrush{
    func supportedContinuousDrawing() ->Bool
    func drawInContext(context:CGContextRef)
}

class BaseBrush: NSObject, PaintBrush {
    var beginPoint: CGPoint!
    var endPoint: CGPoint!
    var lastPoint: CGPoint!
    
    var strokeWidth: CGFloat!
    
    
    
    
    func supportedContinuousDrawing() -> Bool {
        return false
    }
    
    func drawInContext(context: CGContextRef) {
        assert(false, "must implements in subclass.")
    }

}
