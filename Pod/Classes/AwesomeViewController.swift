//
//  ViewController.swift
//  ExpandableTextView
//
//  Created by Alberto on 14/3/16.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit
import Foundation

public class AwesomeViewController: UIViewController, ExpandableTextViewDelegate {
    
    public let toolBar = AwesomeToolbar(frame: CGRectZero, showLeftButton: true)
    
    public var optionsActionSheet: [CustomActionSheetModel]?
    
    public var alert = UIAlertController(title: "My Alert", message: "This is an action sheet.", preferredStyle: .ActionSheet)
    
    private var heightConstraint = NSLayoutConstraint()
    
    //  Then we create a UITOOLBAR, UITEXTVIEW and UIBUTTON, we manage all this UIVIEW with NSLayoutAnchor (a factory class for creating NSLayoutConstraint objects using a fluent API), and also, in some cases we create constraints with NSLayoutConstraint.
    //  UITOOLBAR
    //   |-> UITEXTVIEW
    //   |-> UIBUTTON
    
    override public func viewDidLoad() {
        super.viewDidLoad()
                
        //  Extension to get notifications when the keyboard will/hide appear.
        notificationsKeyboard()
        
        toolBar.textView.customDelegate = self
        
        //  Create Toolbar
        view.addSubview(toolBar)

        //  Add Right Button Action
        toolBar.rightButton.addTarget(self, action: "didPressRightButton", forControlEvents: .TouchUpInside)
        
        if toolBar.hasLeftButton {
            toolBar.leftButton.addTarget(self, action: "didPressLeftButton", forControlEvents: .TouchUpInside)
        }
        
        //  Move the container at different heigh of your view. Put 300 instead of 0
        heightConstraint = toolBar.bottomAnchor.constraintGreaterThanOrEqualToAnchor(view.bottomAnchor, constant: 0)
        heightConstraint.active = true
        
        //  ToolBar Constraints, attach the leading and trailing constraint to our container.
        NSLayoutConstraint.activateConstraints([
            toolBar.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            toolBar.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            ])
    }


    //  Hook
    public func didPressRightButton() {
        print("Right button pressed")
    }
    
    public func didPressLeftButton() {
        print("Left button pressed")
        
        alert = UIAlertController(title: "My Alert", message: "This is an action sheet.", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive) { (alert: UIAlertAction!) -> Void in
            NSLog("You pressed button two")
        }

        
        optionsActionSheet?.forEach { element in
            if let x = element as? CustomActionSheetModel {
                let title = x.title
                let function = x.alertFunction
                
                let action = UIAlertAction(title: title, style: .Default, handler: function!)
                alert.addAction(action)
            }
        }
        
        
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion:nil) // 6

    }
    
    //MARK: TextView Delegate
    func notifyParentView(withHeigh: CGFloat) {
        toolBar.toolBarHeighConstraint.constant = (withHeigh > 30.0) ? withHeigh + 16.0 : 30.0;
        
        UIView.animateWithDuration(0.5, delay: 0, options: .TransitionCurlDown, animations: {
            //  With layoutIfNeeded we can see the transition, if we don't add this method, you will only see a jump to the specified position.
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    //MARK: DeInit
    deinit {
        //  Don't have to do this on iOS 9+, but it still works
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

//  MARK:   Extension Keyboard
extension AwesomeViewController {
    
    func notificationsKeyboard() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShowOrHide:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShowOrHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShowOrHide(notification: NSNotification) {
        if let userInfo = notification.userInfo, endValue = userInfo[UIKeyboardFrameEndUserInfoKey], durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] {
            
            let endRect = view.convertRect(endValue.CGRectValue, fromCoordinateSpace: view.window!)
            let heightToMove = (notification.name == "UIKeyboardWillShowNotification") ? -endRect.height : 0
            heightConstraint.constant = heightToMove
            
            let duration = durationValue.doubleValue
            
            UIView.animateWithDuration(duration, delay: 0, options: .BeginFromCurrentState, animations: {
                //  With layoutIfNeeded we can see the transition, if we don't add this method the toolbar just jump to the specified position.
                self.view.layoutIfNeeded()
                
                }, completion: nil)
        }
    }
    
    override public func viewDidLayoutSubviews() {}
    
}
