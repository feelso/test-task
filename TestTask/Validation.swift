//
//  Validation.swift
//  TestTask
//
//  Created by Arsen on 9/12/19.
//  Copyright © 2019 Arsen. All rights reserved.
//


import UIKit

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
          
            case .number:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .number, .inValidNUMBER)) {
                    return tempValue
                }
            }
        }
        return .success
    }
    
    func isValidString(_ input: (text: String, regex: RegEx, invalidAlert: AlertMessages)) -> Valid? {
        
        if  isValidRegEx(input.text, input.regex) != true {
            return .failure(.error)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

