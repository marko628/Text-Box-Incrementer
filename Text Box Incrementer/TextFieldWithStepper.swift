//
//  TextFieldWithStepper.swift
//  Text Box Incrementer
//
//  Created by Mark Nolte on 4/2/17.
//  Copyright © 2017 Mark Nolte. All rights reserved.
//

import Foundation
import UIKit

class TextFieldWithStepper: NSObject, UITextFieldDelegate {
  
  var stepper: UIStepper!
  var formatter: NumberFormatter = NumberFormatter()
  
  // MARK: Text Field Delegate Functions
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    print("in textFieldShouldEndEditing()")
    
    // set field to formatted stepper value in case text field was left blank or value is outside
    // stepper bounds
    textField.text = formatter.string(from: stepper.value as NSNumber)
    
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("in textField(_:shouldChangeCharactersIn:replacementString:). String before replacement is \(String(describing: textField.text)). Replacement string is \"\(string)\". Range is \(range.location) \(range.length).")
    
    let before = textField.text as NSString?
    let after = before?.replacingCharacters(in: range, with: string)
    print("text after replacement is \(String(describing: after))")
    
    // allows field to be blank temporarily while user is editing
    guard after?.count != 0 else {
      return true
    }
    
    // allows field to temporarily contain a single hyphen while editing, typically 
    // while user is entering or editing a negative number
    if after! == "-" {
      return true
    }
    
    if let amount = Double(after!) {
      print("amount is a Double: \(amount)")
      stepper.value = Double(formatter.string(from: amount as NSNumber)!)!
      print("stepper amount is now \(stepper.value)")
    } else {
      print("text field can't be converted to Double: \(after!)")
      return false
    }
    return true
  }
}
