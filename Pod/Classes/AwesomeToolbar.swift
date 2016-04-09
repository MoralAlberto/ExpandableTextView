//
//  AwesomeToolBar.swift
//  ExpandableTextView
//
//  Created by Alberto Moral on 17/3/16.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit

public class AwesomeToolbar: UIToolbar {
    
    public var rightButton = UIButton()
    public var leftButton = UIButton()
    
    public var hasLeftButton = false
    
    public let textView = ExpandableTextView()
    
    public var textViewTopConstraint    = NSLayoutConstraint()
    public var textViewBottomConstraint = NSLayoutConstraint()
    public var toolBarHeighConstraint   = NSLayoutConstraint()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    convenience init(frame: CGRect, showLeftButton: Bool) {
        self.init(frame: frame)
        
        hasLeftButton = showLeftButton
        
        if hasLeftButton {
            //  Create leftButton
            leftButton.translatesAutoresizingMaskIntoConstraints = false
            leftButton.layer.cornerRadius = 6;
            leftButton.setTitle("Options", forState: .Normal)
            leftButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
            addSubview(leftButton)
            
            //  LEFT BUTTON (may be optional)
            NSLayoutConstraint.activateConstraints([
                leftButton.leadingAnchor.constraintEqualToAnchor(layoutMarginsGuide.leadingAnchor),
                leftButton.bottomAnchor.constraintEqualToAnchor(layoutMarginsGuide.bottomAnchor)
                ])
        }
        
        //  TEXTVIEW Constraints, this is the last one, we need to attach the TEXTVIEW to the TOOLBAR, so they has the same leading, top and bottom constraints, and a trailing space between the trailing textfield and the leading button.
        NSLayoutConstraint.activateConstraints([
            hasLeftButton ? textView.leadingAnchor.constraintEqualToAnchor(leftButton.trailingAnchor, constant: 8) : textView.leadingAnchor.constraintEqualToAnchor(layoutMarginsGuide.leadingAnchor),
            textView.trailingAnchor.constraintEqualToAnchor(rightButton.leadingAnchor, constant: -8),
            textView.topAnchor.constraintEqualToAnchor(topAnchor, constant: 8),
            textView.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -8)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //  Add textfield
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(textView)
        bringSubviewToFront(textView)
        barTintColor = UIColor(colorLiteralRed: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0)
        
        //  Create rightButton
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.layer.cornerRadius = 6;
        rightButton.setTitle("Send", forState: .Normal)
        rightButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        addSubview(rightButton)
        
        
        //  We decide to create a public var to modify the toolBar heigh constant, it could increase depending on the TEXTVIEW's heigh
        toolBarHeighConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 44)
        toolBarHeighConstraint.active = true
        
        

        //  UIBUTTON Constraints, we want the button to be centered with the toolbar and with a trailing space, the standard one (8).
        NSLayoutConstraint.activateConstraints([
            rightButton.trailingAnchor.constraintEqualToAnchor(trailingAnchor, constant: -8),
            rightButton.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -8)
            ])
        

        
        NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Height, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 30).active = true
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}