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
        
        setup()
    }
    
    
    //MARK: Configuration
    func setup() {

        toolBar.textView.maxNumberOfLines = 4
        toolBar.hasLeftButton = false
        
        //  Add options when the left button is pressed
        self.optionsMenuActionSheet = []
        
        //  For every action, we create a function
        let actionSheet: CustomActionSheetModel = CustomActionSheetModel(title: "One") { action in
            print("Action One")
        }
        
        //  Custom Cancel Action, it's optional?
        let cancelMenuActionSheet: CustomActionSheetModel = CustomActionSheetModel(title: "Cancel") { action in
            print("Cancel Action")
        }
        
        self.optionsMenuActionSheet?.append(actionSheet)
        self.dismissMenuActionSheet = cancelMenuActionSheet
    }
    
    
    //MARK:  Override methods
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
}

