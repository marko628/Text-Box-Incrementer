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
  
  func format(_ number: Double) -> String? {
    if let formattedValue = formatter.string(from: number as NSNumber) {
      return formattedValue
    } else {
      return nil
    }
  }
  
  // MARK: Text Field Delegates
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    print("in textFieldDidEndEditing()")
    // set field to formatted stepper value if field was left blank
    textField.text = format(stepper.value)
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    print("in textFieldShouldEndEditing()")
    return true
  }
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print("in textFieldShouldBeginEditing()")
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("in textField(_:shouldChangeCharactersIn:replacementString:). String before replacement is \(textField.text). Replacement string is \"\(string)\". Range is \(range.location) \(range.length).")
    
    let before = textField.text as NSString?
    let after = before?.replacingCharacters(in: range, with: string)
    print("text after replacement is \(after)")
    
    // allows field to be blank temporarily while user is editing
    guard after?.characters.count != 0 else {
      return true
    }
    
    // allows field to temporarily contain a single hyphen while editing, typically 
    // while user is typing a negative number
    if after! == "-" {
      return true
    }
    
    if let amount = Double(after!) {
      print("amount is a Double: \(amount)")
      stepper.value = amount
      print("stepper amount is now \(stepper.value)")
    } else {
      print("text field can't be converted to Double: \(after!)")
      return false
    }
    return true
  }
  
  
  
}
