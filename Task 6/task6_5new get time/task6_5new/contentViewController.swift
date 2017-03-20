//
//  contentViewController.swift
//  task6_5new
//
//  Created by 张皓 on 5/2/16.
//  Copyright © 2016 张皓. All rights reserved.
//

import UIKit

class contentViewController: UIViewController {

    private var content:String!
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = content
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //set text of label
    func setContent(str:String){
        content = str
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
