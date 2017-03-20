//
//  ViewController.swift
//  PerfactAccountBook
//
//  Created by 张皓 on 10/01/2017.
//  Copyright © 2017 张皓. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        
        self.addButton.addTarget(self, action: #selector(addAccount), for: UIControlEvents.touchUpInside)
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var expendLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    func addAccount() {
        
        let addAccountViewCon:AddAccountViewController = AddAccountViewController()
        self.navigationController?.pushViewController(addAccountViewCon, animated: true)
    }

}

