//
//  ContentViewController.swift
//  groupbuy
//
//  Created by 张皓 on 4/27/16.
//  Copyright © 2016 张皓. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    private var title_str: String!
    private var number_str:String!
    private var price_str:String!
    private var pic_str:String!
    
    @IBOutlet weak var titleLabel: UILabel!
    //show image of fruit
    @IBOutlet weak var picture: UIImageView!
    //show number of purchased
    @IBOutlet weak var numberLabel: UILabel!
    //show price
    @IBOutlet weak var priceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picture.image = UIImage(named: pic_str)
        titleLabel.text = title_str
        numberLabel.text = number_str
        priceLabel.text = price_str
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func set_image(pic: String) {
        self.pic_str = pic
    }
    
    func set_title_label(text: String) {
        self.title_str = text
    }
    
    func set_number_label(text: String) {
        self.number_str = text
    }
    
    func set_price_label(text: String) {
        self.price_str = text
    }
    
    func set_all(dict: NSDictionary) {
        self.set_image(dict.objectForKey("picture") as! String)
        self.set_number_label(dict.objectForKey("number of purchased") as! String)
        self.set_title_label(dict.objectForKey("name") as! String)
        self.set_price_label(dict.objectForKey("price") as! String)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
