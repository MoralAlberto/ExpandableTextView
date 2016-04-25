//
//  ActionSheetProtocol.swift
//  Pods
//
//  Created by Alberto on 22/4/16.
//
//

import Foundation

public typealias alertFunctionAction = ((UIAlertAction) -> Void)?

public protocol ActionSheetProtocol {
    var title: String! { get set }
    var alertFunction: alertFunctionAction? { get set }
    
    init(title: String, alertFunction: alertFunctionAction?)
}

//extension ActionSheetProtocol {
//    
//    public init(title: String, alertFunction: alertFunctionAction?) {
//        self.title = title
//        self.alertFunction = alertFunction
//        
//        self.init()
//    }
//}


