//
//  ViewController.swift
//  AnalyzeXML
//
//  Created by 张皓 on 16/8/5.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let paser: NSXMLParser = NSXMLParser.init(contentsOfURL: NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("questions", ofType: "xml")!))!
        let dic: NSDictionary = NSDictionary.init(XMLParser: paser)
        
        print(dic)
        
//        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

