//
//  ActionSheetModel.swift
//  Pods
//
//  Created by Alberto on 21/4/16.
//
//

import Foundation

public struct CustomActionSheetModel: ActionSheetProtocol {
    public var title: String!
    public var alertFunction: alertFunctionAction?
    
    public init(title: String, alertFunction: alertFunctionAction?) {
        self.title = title
        self.alertFunction = alertFunction
    }
    
}