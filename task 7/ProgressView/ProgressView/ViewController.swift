//
//  ViewController.swift
//  ProgressView
//
//  Created by 张皓 on 16/5/10.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var progressView:ProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView = ProgressView(frame: CGRect(x: 20, y: 20, width: 80, height: 80))
        self.view.addSubview(progressView)
        self.progressView.layer.cornerRadius = 20
    }
    @IBAction func updateProgress(sender: UISlider) {
        progressView.progress = CGFloat(sender.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

