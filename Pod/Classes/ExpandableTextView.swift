//
//  AwesomeTextView.swift
//  ExpandableTextView
//
//  Created by Alberto on 15/3/16.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit

protocol ExpandableTextViewDelegate {
    func notifyParentView(withHeigh: CGFloat)
}

public class ExpandableTextView: UITextView {
    
    //  Public API
    public var maxNumberOfLines = 0
    
    var customDelegate: ExpandableTextViewDelegate?
    var minimumHeight: CGFloat = 30.0
    
    private var placeHolder = UILabel()

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        delegate = self
        font = UIFont(name: "Helvetica", size: 20)
        layer.cornerRadius = 4
        backgroundColor = UIColor.whiteColor()

        translatesAutoresizingMaskIntoConstraints = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didChangeTextViewText:", name: UITextViewTextDidChangeNotification, object: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func didChangeTextViewText(notification: NSNotification) {
        let textView = notification.object as? UITextView
        let numberOfLines = self.numberOfLines()
        
        guard ((textView?.isEqual(self)) == nil) || numberOfLines <= maxNumberOfLines else {
            return
        }
        
        if self.frame.height > minimumHeight || numberOfLines >= 2 {
            var ownHeight = self.contentSize.height
            if numberOfLines == 1 {
                let size = CGSizeMake(CGRectGetWidth(self.bounds), 10000)
                ownHeight = self.sizeThatFits(size).height
            }
            
            var ownFrame = self.frame
            ownFrame.size = CGSizeMake(CGRectGetWidth(self.frame), ownHeight)
            self.frame = ownFrame
            self.scrollRangeToVisible(NSMakeRange(self.text.characters.count, 0))
            
            //  Notify to the delegate only when is needed
            self.customDelegate?.notifyParentView(self.frame.height)
        }
    }
    
    private func numberOfLines() -> Int {
        guard (self.text.characters.count != 0) else {
            return 1
        }
        return Int(self.contentSize.height / (self.font?.lineHeight)!)
    }
}



extension ExpandableTextView: UITextViewDelegate {
    public func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            self.resignFirstResponder()
            return false
        }
        return true
    }
    
    public func textViewDidBeginEditing(textView: UITextView) {
        print("Text")
    }
}



