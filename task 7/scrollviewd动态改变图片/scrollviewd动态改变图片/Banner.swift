//
//  Banner.swift
//  scrollviewd动态改变图片
//
//  Created by 张皓 on 16/5/18.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit

public class Banner: UIView, UIScrollViewDelegate {
    
    
    

    private var timer: NSTimer!
    
    //控制轮播的时间间隔和手动滑动后多久开始自动轮播
    private let MinimumTimeInterval = 1.5
    
    //用于控制是否自动轮播
    public var autoScroll = true
    
    //添加监视器，在 aytoscrollTimeInterval 的值变化后重新添加计时器
    public var autoScrollTimeInterval = 1.5{
        didSet {
            if autoScrollTimeInterval < MinimumTimeInterval {
                autoScrollTimeInterval = MinimumTimeInterval
            }
            
            if autoScroll {
                self.stopTimer()
                self.startTimer()
            }
        }
    }
    
    var pageControlEnabled = true                         //控制是否添加pagecontrol
    var pageIndicatorColor = UIColor.whiteColor()        //控制pagecontrol颜色属性
    var currentPageIndicatorColor = UIColor.blueColor()   //控制pagecontrol颜色属性
    
    private var pageControl: UIPageControl!
    
    
    //加载pagecontroll
    private func loadPageControl() -> UIPageControl {
        let pageControlHeight: CGFloat = 50
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: self.height - 50, width: self.width, height: pageControlHeight))
        
        pageControl.numberOfPages = self.images.count - 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor = UIColor.cyanColor()
        
        return pageControl
    }
    
    private var scrollView: UIScrollView!
    
    
    //加载scrollview
    private func loadScrollView() -> UIScrollView {
        let _scrollView = UIScrollView(frame: self.frame)
        
        for (index, imageName) in self.images.enumerate() {
            let imageView = UIImageView(image: UIImage(named: imageName))
            
            imageView.frame = CGRectMake(CGFloat(index) * self.width, self.frame.origin.y, self.width, self.height)
            imageView.contentMode = .ScaleAspectFill
            imageView.userInteractionEnabled = true
            imageView.clipsToBounds = true
            _scrollView.addSubview(imageView)
        
        }
        _scrollView.userInteractionEnabled = true
        _scrollView.delegate = self
        _scrollView.pagingEnabled = true
        _scrollView.scrollEnabled = true
//        _scrollView.showsHorizontalScrollIndicator = false
//        _scrollView.showsVerticalScrollIndicator = false
        _scrollView.contentSize = CGSize(width: self.width * CGFloat(self.images.count), height: self.height)
        _scrollView.contentOffset = CGPoint(x: self.width, y: 0)
        
        return _scrollView
        
    }
    
    
    //动态存储照片，并添加监视器，在images的值改变后，重新加载页面
    private var images: [String] {
        didSet {
            for subView in self.subviews {
                subView.removeFromSuperview()
            }
            
            self.scrollView = loadScrollView()
            self.addSubview(scrollView)
            if pageControlEnabled {
                self.pageControl = loadPageControl()
                self.addSubview(pageControl)
            }
            if autoScroll {
                self.startTimer()
            }
        }
    }
    
    //添加计时器
    private func startTimer() {
        if timer == nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(autoScrollTimeInterval, target: self, selector: #selector(Banner.scrollToNextPage), userInfo: nil, repeats: true)
        }
    }
    
    //终止计时器
    private func stopTimer() {
        timer.invalidate()
        timer = nil
    }
    
    
    //更换到下一张图片
    @objc private func scrollToNextPage() {

        
        
        var page:Int = pageControl.currentPage
        page += 1
        if page == images.count - 2 {
            page = 0
            let point = CGPointMake(width * CGFloat(page + 1), 0)
            scrollView.setContentOffset(point, animated: false)
        } else {
            let point = CGPointMake(width * CGFloat(page + 1), 0)
            scrollView.setContentOffset(point, animated: true)
        }
    }
    
    
    
    
    private var width: CGFloat {
        return self.frame.width
    }
    
    private var height: CGFloat {
        return self.frame.height
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.images = []
        super.init(coder: aDecoder)
    }
    
    override public init(frame: CGRect) {
        self.images = []
        super.init(frame: frame)
    }
    
    //外部可调用的函数，动态改变图片
    public func setBannerImages(imagesArray: [String]) {
        var tempArray = [String]()
        
        tempArray.append(imagesArray.last!)
        tempArray.appendContentsOf(imagesArray)
        tempArray.append(imagesArray.first!)
        self.images = tempArray
    }
    
    //MARK: UIScrollViewDelegate
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        if pageControl != nil {
            
        
        let page = Int(scrollView.contentOffset.x / width + 0.5)  // 下一张超过半页，则进行进位
        if page == 0 {
            pageControl.currentPage = images.count - 2
        } else if page == images.count - 1 {
            pageControl.currentPage = 1
        } else {
            pageControl.currentPage = page - 1
        }
        }

        
    }
    
    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var page = Int(scrollView.contentOffset.x / width + 0.5)
        var point:CGPoint!
        
        if page == 0  {
            
            page = images.count - 2
            point = CGPointMake(width * CGFloat(page), 0)
            scrollView.setContentOffset(point, animated: false)
            
        } else if page == images.count - 2 + 1 {
            
            page = 1
            point = CGPointMake(width * CGFloat(page), 0)
            scrollView.setContentOffset(point, animated: false)
            
        } else {
            
        }



    }
    public func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        dispatch_after(2, dispatch_get_main_queue()) {
            
            self.startTimer()
            
        }
        
    }
    

    
    
    
    

}







