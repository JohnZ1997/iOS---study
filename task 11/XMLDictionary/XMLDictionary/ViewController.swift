//
//  ViewController.swift
//  XMLDictionary
//
//  Created by 张皓 on 16/8/6.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSXMLParserDelegate {

    var dict:[String: String]!
    var parser: NSXMLParser!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dict = [:]
        
        let pathStr = NSBundle.mainBundle().pathForResource("person", ofType: "xml")
        let url = NSURL.fileURLWithPath(pathStr!)
        
        parser = NSXMLParser.init(contentsOfURL: url)
        parser.delegate = self
        parser.parse()
        
        
    
    }

    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "property" {
            currentKey = attributeDict["title"]
        }
    }
    var currentKey: String!
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        
       let nowString = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if nowString != "" {
            currentValue = nowString
        }
        
    }
    var currentValue: String!
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.dict.updateValue(currentValue, forKey: currentKey)
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        print(dict)
    }
    


}

