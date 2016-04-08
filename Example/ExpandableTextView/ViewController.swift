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
        
        toolBar.textView.maxNumberOfLines = 3
    }
    
    override func didPressRighButton() {
        let alert = UIAlertController(title: "Awesome!", message:"\(toolBar.textView.text)", preferredStyle: .Alert)
        let action = UIAlertAction(title: "You're right", style: .Default) { _ in
            print("Message: \(self.toolBar.textView.text)")
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true){}
        
        super.didPressRighButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

