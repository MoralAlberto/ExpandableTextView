//
//  ActionSheetModel.swift
//  Pods
//
//  Created by Alberto on 21/4/16.
//
//

import Foundation

public typealias alertFunctionAction = ((UIAlertAction) -> Void)?

public struct CustomActionSheetModel {
    public var title: String!
    public var alertFunction: alertFunctionAction?
    
    public init(title: String, alertFunction: alertFunctionAction?) {
        self.title = title
        self.alertFunction = alertFunction
    }
    
}