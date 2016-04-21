//
//  ViewController.swift
//  ExpandableTextView
//
//  Created by Alberto Moral on 04/08/2016.
//  Copyright (c) 2016 Alberto Moral. All rights reserved.
//

import ExpandableTextView

class ViewController: AwesomeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionSheet: CustomActionSheetModel = CustomActionSheetModel(title: "One") { action in
             print("Action One")
        }
        
        toolBar.textView.maxNumberOfLines = 4
        toolBar.hasLeftButton = false
        
        self.optionsActionSheet = []
        self.optionsActionSheet?.insert(actionSheet, atIndex: 0)
    }
    
    override func didPressRightButton() {
        let alert = UIAlertController(title: "Awesome!", message:"\(toolBar.textView.text)", preferredStyle: .Alert)
        let action = UIAlertAction(title: "You're right", style: .Default) { _ in
            print("Message: \(self.toolBar.textView.text)")
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true){}
        
        super.didPressRightButton()
    }
    
    override func didPressLeftButton() {
        print("Hi! left button has been pressed!")
        
        
        super.didPressLeftButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

