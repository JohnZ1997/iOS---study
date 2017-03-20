//
//  DetailViewController.swift
//  Notes
//
//  Created by 张皓 on 16/8/8.
//  Copyright © 2016年 张皓. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    enum ChangeOrAdd {
        case Change
        case Add
    }
    
    var changeOrAdd: ChangeOrAdd!
    
    @IBOutlet var tvNote: UITextView!

    var delegateForAdd: addNewNoteDelegate?
    var delegateForChange: changeOldNoteDelegate?
    var delegateForDelete: deleteOldNoteDelegate?
    
    var detailItem: AnyObject? {
        didSet {
            
            self.configureView()
        }
        
        
    }
    
    //刷新
    func configureView() {
        
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let textView = self.tvNote {
                textView.text = detail.valueForKey("timeStamp")!.description
                
            }
        } else {
            if let textView = self.tvNote {
                textView.text = ""
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let deleteBtn = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: #selector(deleteNote))
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(save))

        self.navigationItem.setRightBarButtonItems([saveBtn, deleteBtn], animated: true)
    }
    
    //MARK: -按钮响应函数
    func save() {
        
        let note = self.tvNote.text
        
        if changeOrAdd == ChangeOrAdd.Add {
            self.delegateForAdd?.addNewNote(note)
        } else if changeOrAdd == ChangeOrAdd.Change {
            self.delegateForChange?.changeOldNote(note)
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func deleteNote() {
        
        if changeOrAdd == ChangeOrAdd.Change {
            self.delegateForDelete?.deleteOldNote()
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

