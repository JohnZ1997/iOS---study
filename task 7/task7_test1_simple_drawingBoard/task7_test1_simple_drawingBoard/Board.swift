//
//  Board.swift
//  task7_test1_simple_drawingBoard
//
//  Created by 张皓 on 5/3/16.
//  Copyright © 2016 张皓. All rights reserved.
//

import UIKit

enum Drawingstate {
    case Began, Moved, Ended
    
}

class Board: UIImageView {
    
    public var drawingState: Drawingstate!

    var strokeWidth: CGFloat!
    var strokeColor: UIColor!
    
    var brush:BaseBrush?
    private var realImage: UIImage?
    
/*override init() {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1
        
        super.init(coder: aDecoder)
    }*/
    //MARK: touches method
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        if let brush = self.brush {
            brush.lastPoint = nil
            
            brush.beginPoint = touches.anyObject()!.locationInView(self)
            brush.endPoint = brush.beginPoint
            
            self.drawingState = .Began
            self.drawingImage()
        }

    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if let brush = self.brush {
            brush.endPoint = touches.anyObject()!.locationInView(self)
            
            self.drawingState = .Moved
            self.drawingImage()
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if let brush = self.brush {
            brush.endPoint = touches.anyObject()!.locationInView(self)
            
            self.drawingState = .Ended
            
            self.drawingImage()
        }
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        if let brush = self.brush {
            brush.endPoint = nil
        }
    }
    
    
    private func drawingImage(){
        if let brush = self.brush {
            
            // 1.
            UIGraphicsBeginImageContext(self.bounds.size)
            
            // 2.
            let context = UIGraphicsGetCurrentContext()
            
            UIColor.clearColor().setFill()
            UIRectFill(self.bounds)
            
            CGContextSetLineCap(context, kCGLineCapRound)
            CGContextSetLineWidth(context, self.strokeWidth)
            CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor)
            
            // 3.
            if let realImage = self.realImage {
                realImage.drawInRect(self.bounds)
            }
            
            // 4.
            brush.strokeWidth = self.strokeWidth
            brush.drawInContext(context!);
            CGContextStrokePath(context)
            
            // 5.
            let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            if self.drawingState == .Ended || brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            
            UIGraphicsEndImageContext()
            
            // 6.
            self.image = previewImage;
            
            brush.lastPoint = brush.endPoint
        }
        
    }
    

    
    

    
}

class PencilBrush: BaseBrush {
    
    override func drawInContext(context: CGContextRef) {
        if let lastPoint = self.lastPoint {
            CGContextMoveToPoint(context, lastPoint.x, lastPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        } else {
            CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        }
    }
    
    override func supportedContinuousDrawing() -> Bool {
        return true
    }
}



