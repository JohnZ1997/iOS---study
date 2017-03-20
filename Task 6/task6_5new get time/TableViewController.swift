//
//  TableViewController.swift
//  task6_5new
//
//  Created by 张皓 on 5/2/16.
//  Copyright © 2016 张皓. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
    var listItem = [String]()

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        //set left button
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        //set right button
        let buttonItem  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(TableViewController.clicka))
        self.navigationItem.rightBarButtonItem = buttonItem
        
        //set title fo tbaleview
        self.navigationItem.title = "时间的插入和删除"
        
    }
    
    func clicka(){
        //get time of system
        let date = NSDate()
        
        //set format of date
        let dateFormate = NSDateFormatter()
        dateFormate.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        
        //change format to string
        let strNow = dateFormate.stringFromDate(date) as String
        
        //add new item to listItem
        listItem.append(strNow)
        
        //reload the tableView
        self.tableview.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listItem.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(1) as! UILabel
        label.text = listItem[listItem.count-1-indexPath.row] as String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete the row from the data source
            self.listItem.removeAtIndex(listItem.count-1-indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            // remove item of Array
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            self.listItem.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contentVC = storyboard?.instantiateViewControllerWithIdentifier("content") as! contentViewController
        contentVC.setContent(listItem[listItem.count-1-indexPath.row])
        navigationController?.pushViewController(contentVC, animated: true)
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
