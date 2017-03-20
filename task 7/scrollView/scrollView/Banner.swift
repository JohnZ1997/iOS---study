//
//  Banner.swift
//  scrollView
//
//  Created by 张皓 on 16/5/16.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit

public class Banner: UIView, UIScrollViewDelegate {

 
    
    

    
    
    
    var _dataSource: [String] {
        didSet{
            for subViews in self.subviews {
                subViews.removeFromSuperview()
            }
            self.initContainerView()
            self.scrollView = loadScrollView()
//            self.containerView.addSubview(scrollView)
            self.pageControl = loadPageControl()
//            self.containerView.addSubview(pageControl)
            containerView.insertSubview(pageControl, aboveSubview: scrollView)
            
            
            
        }
        
    }
    
    
    
    
    func setBannerImages(imagesArray: [String])  {
        var tempArray = [String]()
        tempArray.append(imagesArray.last!)
        tempArray.appendContentsOf(imagesArray)
        tempArray.append(imagesArray.first!)
        self._dataSource = imagesArray
        
    }
    
    


    
    // 定义4个view, scrollView 照片浏览器；pageControl 页数显示器
    // containerView 底部View 用于装载其它3个view
    // titleView 用于显示标题
    private var scrollView  :UIScrollView!
    private var pageControl :UIPageControl!
    private var containerView: UIView!
    private var titleView:UIView!
    
    
    private let kScreenHeight  = UIScreen.mainScreen().bounds.height  // 屏幕高
    private let kScreenWidth   = UIScreen.mainScreen().bounds.width   // 屏幕宽
    private let pageGapWidth:CGFloat  = 10                                   // 每页间距
    
    private var scrollY:CGFloat  = 50                                   // scrollView距离顶部距离
    
    
    private var imgViewWidth:CGFloat!   // imgView的宽度
    private var imgViewHeight:CGFloat!                                           // imgView的高度
    
    private var pageCount:Int!                                                   // 照片数
    private var pageControlHeight:CGFloat = 20                                   // pageControl的高度
    private var pageControlWidth:CGFloat!  // pageControl的宽度
    private var scrollViewWidth:CGFloat!// scrollView的宽度
    private var scrollViewHeight:CGFloat! // scrollView的高度
    
    private var timer:NSTimer!
    
    
    public var _scrollDuration:Double!                                           // 照片切换的间隔时间，接口变量
    
        // scrollDuration get和set 函数
    public var scrollDuration:Double! {
        
        set{if (newValue == nil) {
                _scrollDuration = 2
            } else if (newValue <= 0) {
                _scrollDuration = 0
            } else {
                _scrollDuration = newValue
            }
        }
        get{
            return _scrollDuration
        }
        
    }
    
    
    override init(frame: CGRect) {
        _dataSource = ["1.jpg", "3.jpg"]
//        _dataSource = ["sfsd"]
        super.init(frame: frame)
    
        
        // 导入plist文件
//        _dataSource = NSMutableArray(contentsOfURL: NSBundle.mainBundle().URLForResource("jpg",
//            withExtension: "plist")!)
        
        
        
        pageCount  = _dataSource.count    // 取得照片数
        
        // 计算下面视图的宽度和高度
        scrollViewWidth  = kScreenWidth
        scrollViewHeight = kScreenHeight - scrollY * 3
        
        imgViewWidth     = kScreenWidth - pageGapWidth
        imgViewHeight    = scrollViewHeight
        
        pageControlWidth = imgViewWidth
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func drawRect(rect: CGRect) {
        // 视图初始化；定时器初始化
        
        initTitleView()
//        initPageControl()
        self.scrollView = loadScrollView()
        self.pageControl = loadPageControl()
////        initScrollView()
        
        self.initContainerView()
        containerView.insertSubview(pageControl, aboveSubview: scrollView)
        addTimer()
        
    }
    
    
    // 容器view初始化
    private func initContainerView() {
        containerView                 = UIView.init(frame: CGRectMake(0, 20, kScreenWidth, kScreenHeight-100))
        containerView.backgroundColor = UIColor.blackColor()
        self.addSubview(containerView)
//        self.addSubview(pageControl)
    }
    
    
    
    
    
    
    // scrollView初始化
    func loadScrollView() -> UIScrollView {
        
        let _scrollView = UIScrollView.init(frame: CGRectMake(0, scrollY,
            scrollViewWidth, scrollViewHeight))
        
        // 设置代理
        _scrollView.delegate = self
        
        // 加载照片
        for  i in 0 ..< pageCount + 2  {
            
            let imgView = UIImageView.init(frame: CGRectMake(kScreenWidth * CGFloat(i) + pageGapWidth/2,scrollY,
                imgViewWidth,imgViewHeight))
            if i == 0 {
                
                imgView.image = UIImage(named: _dataSource[pageCount - 1] /*as! String*/)
                
            } else if i == pageCount + 1 {
                
                imgView.image = UIImage(named: _dataSource[0] /*as! String*/)
                
            } else {
                
                imgView.image = UIImage(named: _dataSource[i - 1] /*as! String*/)
                
            }
            _scrollView.addSubview(imgView)
            
        }
        
        _scrollView.contentSize = CGSizeMake(kScreenWidth * CGFloat(pageCount + 2), scrollViewHeight)
        _scrollView.pagingEnabled = true
        
        
        
        let point = CGPointMake(kScreenWidth * CGFloat(1), 0)
        _scrollView.setContentOffset(point, animated: false)
        
        
//        containerView.insertSubview(pageControl, aboveSubview: _scrollView) // 加载pageControl应放在 scrollView加载之后
        
        return _scrollView
    }
    
    
    // pageControl初始化
     func loadPageControl() -> UIPageControl{
        let _pageControl = UIPageControl.init(frame: CGRectMake(pageGapWidth / 2,kScreenHeight - scrollY*2 - pageControlHeight,pageControlWidth, pageControlHeight))
        
        _pageControl.backgroundColor               = UIColor.clearColor()
        _pageControl.alpha                         = 0.5
        _pageControl.numberOfPages                 = pageCount
        _pageControl.pageIndicatorTintColor        = UIColor.greenColor()
        _pageControl.currentPageIndicatorTintColor = UIColor.yellowColor()
        
        return _pageControl
    }
    // 标题view初始化
    private func initTitleView() {
        
        titleView                 = UIView.init(frame: CGRectMake(120, 20, kScreenWidth, 30))
        titleView.backgroundColor = UIColor.blackColor()
        titleView.alpha           = 0.8
        
        let title = UILabel.init(frame: CGRectMake(5, 30, 200, 20))
        title.textColor           = UIColor.cyanColor()
        title.text                = "IOS IMAGE BANNER"
        
        titleView.addSubview(title)
        self.addSubview(titleView)
    }

    
    
    // 照片转场时，取得当前显示照片的页码传给pageControl的当前页
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollViewWidth + 0.5)  // 下一张超过半页，则进行进位
        if page == 0 {
            pageControl.currentPage = pageCount
        } else if page == pageCount + 1 {
            pageControl.currentPage = 1
        } else {
            pageControl.currentPage = page - 1
        }
        
    }
    
    
    // 手指滑动以后，头尾页面跳转
    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        var page = Int(scrollView.contentOffset.x / scrollViewWidth + 0.5)
        var point:CGPoint!
        
        if page == 0  {
            
            page = pageCount
            point = CGPointMake(kScreenWidth * CGFloat(page), 0)
            scrollView.setContentOffset(point, animated: false)
            
        } else if page == pageCount + 1 {
            
            page = 1
            point = CGPointMake(kScreenWidth * CGFloat(page), 0)
            scrollView.setContentOffset(point, animated: false)
            
        } else {
            
        }
    }
    
    // 设置定时器duration is scrollDuration
    private func addTimer() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(_scrollDuration, target: self, selector: #selector(nextPage),userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
    }
    
    
    // 自动翻页函数，实现自动翻页
    func nextPage() {
        
        var page:Int = pageControl.currentPage
        page += 1
        if page == pageCount {
            page = 0
            let point = CGPointMake(kScreenWidth * CGFloat(page + 1), 0)
            scrollView.setContentOffset(point, animated: false)
        }
        else {
            let point = CGPointMake(kScreenWidth * CGFloat(page + 1), 0)
            scrollView.setContentOffset(point, animated: true)
        }
    }
    
    
    // 当手指在屏幕上滑动时，调用removeTimer函数，停止计时器（终止自动播放）
    public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        removeTimer()
    }
    
    
    // 停止计时函数
    func removeTimer() {
        timer.invalidate()
        timer = nil
    }
    
    
    // 手指不再滑动后2秒，重新开启计时器
    public func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        
        dispatch_after(2, dispatch_get_main_queue()) {
            
            self.addTimer()
            
        }
        
    }
    
//    func reloadBannerImages() {
//        
//        for subView in self.scrollView.subViews {
//            subView.removeFromSuperView()
//        }
//        for image in _dataSource {
//            scrollView.addSubView(UIIMageView)
//        }
//    }
    
    func changeBannerImages()  {
        self._dataSource = ["1.jpg", "2.jpg", "3.jpg"]
    }
    
    
}



