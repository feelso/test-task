//
//  ValidationEnums.swift
//  TestTask
//
//  Created by Arsen on 9/12/19.
//  Copyright © 2019 Arsen. All rights reserved.
//


import UIKit
import Foundation

enum Alert {        //for failure and success results
    case success
    case failure
    case error
}
//for success or failure of validation with alert message
enum Valid {
    case success
    case failure(Alert)
}
enum ValidationType {

    case number
}
enum RegEx: String {
    case number = "[1-9]{1}" // Year length 1-4
}

enum AlertMessages: String {
 
    case inValidNUMBER = "Invalid number"
    case emptyNUMBER = "Empty Number"
    
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
